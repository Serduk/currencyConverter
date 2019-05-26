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
    child: Scaffold(
      appBar: AppBar(title: const Text('Redux Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, String>(
              converter: (store) {
                store.state.login;
                store.state.password;
              },
              builder: (_, text) => Text(
                '$text',
              ),
            ),
            _LoginField(),
            _PassField(),
            _BtnLogin(),
          ],
        ),
      ),
    ),
  );
}

class _LoginField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, VoidCallback>(
    rebuildOnChange: true,
    converter: (store) => () => store.dispatch(action),
    builder: (_, callback) => TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'email@example.com',
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
//        action.PerformLogin();
      },
    ),
  );
}

class _PassField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, VoidCallback>(
    rebuildOnChange: true,
    converter: (store) => () => store.dispatch(action),
    builder: (_, callback) => TextFormField(
    autovalidate: false,
    obscureText: true,
      decoration: InputDecoration(
      labelText: 'Password',
      prefixIcon: Icon(Icons.account_box),
      suffixIcon: IconButton(
      icon: Icon(Icons.lock_outline), onPressed: () {},
      )),
    ),
  );
}

class _BtnLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, VoidCallback>(
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