import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'actions.dart' as action;
import 'state.dart';

class ReduxPage extends StatelessWidget {
  ReduxPage({this.store, Key key}) : super(key: key);

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
//            _LoginField(),
//            _PassField(),
//            _BtnLogin(
//              action: action.PerformLogin(
//                  email, pass, () => Navigator.of(context).push(dddd)),
//            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key key, this.action}) : super(key: key);

  final Object action;

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;

    return Column(
      children: <Widget>[
        emailField(),
        passField(),
        loginButton(context, action.PerformLogin(
          _email, _password, () => Navigator.of(context).push(context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    CurrenciesPage(title: 'Currency')));
        )),
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

//class _PassField extends StatelessWidget {
//  const _PassField({Key key, this.action}) : super(key: key);
//
//  final Object action;
//
//  @override
//  Widget build(BuildContext context) => TextFormField(
//        autovalidate: false,
//        obscureText: true,
//        decoration: InputDecoration(
//            labelText: 'Password',
//            prefixIcon: Icon(Icons.account_box),
//            suffixIcon: IconButton(
//              icon: Icon(Icons.lock_outline),
//              onPressed: () {},
//            )),
//        validator: (msg) {
//          if (msg.length < 6) {
//            return 'Your password too short';
//          }
//        },
//      );
//}

//class _BtnLogin extends StatelessWidget {
//  const _BtnLogin({Key key, this.action}) : super(key: key);
//
//  final Object action;
//
//  @override
//  Widget build(BuildContext context) => StoreConnector<AppState, VoidCallback>(
//        rebuildOnChange: false,
//        converter: (store) => () => store.dispatch(action),
//        builder: (_, callback) => RaisedButton(
//              onPressed: callback,
//              child: Text('Login'),
//              color: Theme.of(context).primaryColor,
//              textColor: Colors.white,
//            ),
//      );
//}
