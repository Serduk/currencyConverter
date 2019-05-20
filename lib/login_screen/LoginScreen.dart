import 'package:flutter/material.dart';
import 'package:currency_converter/currency_screen/CurrencyPage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String _email;
  String _password;
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Builder(
        builder: (context) => Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
//                      suffixText: '@mail.com',
                      hintText: 'email@example.com',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
//                      if (!email.contains('@')) {
                      if (email.toLowerCase() != 'serhii') {
                        return 'Please, Enter valid email';
                      }
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  TextFormField(
                    autovalidate: false,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.account_box),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.lock_outline
                              : Icons.lock_open),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        )),
                    validator: (password) {
                      if (password.length < 6) {
                        return 'Your password too short';
                      }
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      var currentState = _formKey.currentState;
                      if (currentState.validate()) {
                        currentState.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CurrenciesPage(title: 'Currency')));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Oops. Something went wrong :-(')));
                      }
                    },
                    child: Text('Login'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
      ),
    );
  }
}
