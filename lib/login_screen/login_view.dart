import 'package:currency_converter/login_screen/login_model.dart';
import 'package:currency_converter/login_screen/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/currency_screen/CurrencyPage.dart';
import 'package:currency_converter/strings.dart' as str;

// https://stackoverflow.com/questions/53745546/how-to-rotate-an-image-using-flutter-animationcontroller-and-transform
class LoginScreen extends StatefulWidget {
  final presenter = LoginPresenter(LoginModel());

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>
    with SingleTickerProviderStateMixin
    implements LoginView {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    widget.presenter.view = this;

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        }
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.view = null;
    _animation = null;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        emailField(),
                        passwordField(),
                        btnLogin(),
                      ],
                    ),
                  ),
                  flex: 0,
                ),
                Flexible(
                  child: Container(
                    child: image(),
                  ),
                  flex: 1,
                ),
              ],
            ),
          )),
    );
  }

  @override
  void login() {
    if (_formKey.currentState.validate()) {
      var currentState = _formKey.currentState;
      currentState.save();
    }
  }

  @override
  void navigateToCurrencyScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                CurrenciesPage(title: 'Currency')));
  }

  @override
  void showLoginError() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(str.somethingWrong)));
  }

  @override
  void showPassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'email@example.com',
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (email) => widget.presenter.emailValidate(email),
      onSaved: (value) {
        widget.presenter.emailValidate(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      autovalidate: false,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.account_box),
          suffixIcon: IconButton(
            icon: Icon(_obscurePassword ? Icons.lock_outline : Icons.lock_open),
            onPressed: () {
              showPassword();
            },
          )),
      validator: (password) => widget.presenter.passValidate(password),
      onSaved: (value) {
        widget.presenter.passValidate(value);
      },
    );
  }

  Widget btnLogin() {
    return RaisedButton(
      onPressed: () {
        widget.presenter.login();
      },
      child: Text('Login'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
    );
  }

  Widget image() {
    return RotationTransition(
      turns: _animation,
      child: Icon(Icons.attach_money),
    );
  }
}
