import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_change_model.dart';
import 'mocks.dart';

void main() {
  MockAuth mockAuth;
  EmailSignInChangeModel model;

  setUp(() {
    mockAuth = MockAuth();
    model = EmailSignInChangeModel(auth: mockAuth);
  });
  test('update-email', () {
    mockAuth = MockAuth();
    model = EmailSignInChangeModel(auth: mockAuth);
    var didNotifyListeners = false;
    model.addListener(() => didNotifyListeners = true);
    const sampleEmail = 'email@email.com';
    model.updateEmail(sampleEmail);
    expect(model.email, sampleEmail);
    expect(didNotifyListeners, true);
  });
}
