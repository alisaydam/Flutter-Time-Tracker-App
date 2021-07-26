import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_manager.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.manager, required this.isLoading})
      : super(key: key);
  final SignInManager manager;
  final bool isLoading;

  static const Key emailPasswordKey = Key('email-password');

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(
            auth: auth,
            isLoading: isLoading,
          ),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) => SignInPage(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseAuthException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInAnnonymously(BuildContext context) async {
    try {
      await manager.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFaceBook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2,
      ),
      body: _buildContainer(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
              child: _buildHeader(),
            ),
            SizedBox(height: 48),
            SocialSignInButton(
              assetName: 'images/google-logo.png',
              text: 'Sign in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: isLoading ? null : () => _signInWithGoogle(context),
            ),
            SizedBox(height: 8),
            SocialSignInButton(
              assetName: 'images/facebook-logo.png',
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              color: Color(0xFF334D92),
              onPressed: isLoading ? null : () => _signInWithFacebook(context),
            ),
            SizedBox(height: 8),
            SignInButton(
              key: emailPasswordKey,
              text: 'Sign in with Email',
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: isLoading ? null : () => _signInWithEmail(context),
            ),
            SizedBox(height: 8),
            Text('or',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center),
            SizedBox(height: 8),
            SignInButton(
              text: 'Go anonymouss',
              textColor: Colors.black,
              color: Colors.lime[300],
              onPressed: isLoading ? null : () => _signInAnnonymously(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
