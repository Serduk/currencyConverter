import 'package:currency_converter/currency_screen/CurrencyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'state.dart';
import 'actions.dart' as action;

// default view
class RedLoginPage extends StatelessWidget {
  RedLoginPage({this.store, Key key}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: store,
        child: scaff(),
      );

  Widget scaff() {
    return Scaffold(
      appBar: AppBar(title: const Text('Redux Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, bool>(
              converter: (store) => store.state.isLogged,
              builder: (_, isLogged) => Text(
                    '$isLogged',
                  ),
            ),
            _LoginForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key key}) : super(key: key);

  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        emailField(),
        passField(),
        loginButton(
          context,
          action.PerformLogin(
              _email,
              _password,
              () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CurrenciesPage(title: 'Currency')))),
        ),
      ],
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'email@example.com',
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (msg) {
        if (msg.toLowerCase() != 'serhii') {
          return 'Please, Enter valid email';
        }
      },
      onSaved: (value) {
//        action.PerformLogin();
      },
    );
  }

  Widget passField() {
    return TextFormField(
      autovalidate: false,
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.account_box),
          suffixIcon: IconButton(
            icon: Icon(Icons.lock_outline),
            onPressed: () {},
          )),
      validator: (msg) {
        if (msg.length < 6) {
          return 'Your password too short';
        }
      },
    );
  }

  Widget loginButton(BuildContext context, action) {
    return StoreConnector<AppState, VoidCallback>(
      rebuildOnChange: false,
      converter: (store) => () => store.dispatch(action),
      builder: (_, callback) => RaisedButton(
            onPressed: callback,
            child: Text('Login'),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
    );
  }
}
