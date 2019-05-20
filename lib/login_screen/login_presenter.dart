import 'package:currency_converter/login_screen/login_model.dart';

abstract class LoginView {
  void login();

  void showLoginError();

  void showPassword();

  void navigateToCurrencyScreen();
}

class LoginPresenter {
  LoginPresenter(this.model);

  bool _isEmailValid;
  bool _isPasswordValid;

  LoginView view;
  final LoginModel model;

  emailValidate(String email) {
    model.login = email;
    if (email.toLowerCase() != 'serhii') {
      _isEmailValid = false;
      return 'Please, Enter valid email';
    } else {
      _isEmailValid = true;
    }
  }

  passValidate(String password) {
    model.password = password;
    if (password.length < 6) {
      _isPasswordValid = false;
      return 'Your password to short';
    } else {
      _isPasswordValid = true;
    }
  }

  login() {
    view.login();

    if (_isEmailValid && _isPasswordValid) {
      view.navigateToCurrencyScreen();
    } else {
      view.showLoginError();
    }
  }
}
