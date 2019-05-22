import 'package:currency_converter/login_screen/login_model.dart';
import 'package:currency_converter/login_screen/login_presenter.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';

class MockModel extends Mock implements LoginModel {}

class MockView extends Mock implements LoginView {}

void main() {
  group('Login model test', () {
    LoginModel model;

    setUp(() {
      model = LoginModel();
    });

    test('Error message shouldn\'t be displayed', () {
      expect(model.login, null);
      expect(model.password, null);
    });
  });

  group('Presenter test', () {
    LoginPresenter presenter;
    LoginView view;
    LoginModel model;

    setUp(() {
      model = MockModel();
      when(model.login).thenReturn(null);
      when(model.password).thenReturn(null);

      presenter = LoginPresenter(model);
      view = MockView();

      presenter.view = view;
    });

    test('login with wrong credentials', () {
      verifyNever(model.login);
      verifyNever(model.password);

      presenter.emailValidate(model.login);
      presenter.passValidate(model.password);

      presenter.login();
      verify(view.showLoginError());
    });
  });
}
