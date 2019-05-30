import 'package:currency_converter/login_screen/redux/reducers.dart';
import 'package:currency_converter/login_screen/redux/redux_page.dart';
import 'package:currency_converter/login_screen/redux/state.dart';
import 'package:flutter/material.dart';
//import 'package:currency_converter/login_screen/LoginScreen.dart';
import 'package:currency_converter/login_screen/login_view.dart';
import 'package:redux/redux.dart';

import 'login_screen/redux/middleware.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
      appState,
      initialState: AppState(isLogged: false),
      middleware: [LoginMiddleware()]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RedLoginPage(store: store),
      theme: ThemeData(primarySwatch: Colors.blueGrey, canvasColor: Colors.white70),
    );
  }
}
