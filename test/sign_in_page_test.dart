import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_form_stateful.dart';
import 'package:time_tracker/app/sign_in/sign_in_page.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:mockito/mockito.dart';
import 'mocks.dart';

//this entire test filed check later.388
void main() {
  MockAuth mockAuth;
  MockNavigatorObserver? mockNavigatorObserver;
  setUp(() {
    mockAuth = MockAuth();
    mockNavigatorObserver = MockNavigatorObserver();
  });

  Future<void> pumpSignInPage(WidgetTester tester) async {
    mockAuth = MockAuth();
    mockNavigatorObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      Provider<AuthBase>(
        create: (_) => mockAuth,
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: SignInPage.create(context),
            ),
          ),
          navigatorObservers: [mockNavigatorObserver!],
        ),
      ),
    );
    verify(
      mockNavigatorObserver!.didPush(any!, any),
    ).called(1);
  }

  testWidgets('email & password navigation', (WidgetTester tester) async {
    await pumpSignInPage(tester);
    final emailSignInButton = find.byKey(SignInPage.emailPasswordKey);
    expect(emailSignInButton, findsOneWidget);
    await tester.tap(emailSignInButton);
    await tester.pumpAndSettle();

    verify(
      mockNavigatorObserver!.didPush(any!, any),
    ).called(1);
  });
}
