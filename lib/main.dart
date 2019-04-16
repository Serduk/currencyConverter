import 'package:flutter/material.dart';
import 'LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(primarySwatch: Colors.blueGrey, canvasColor: Colors.white70),
    );
  }
}
