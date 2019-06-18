import 'package:currency_converter/login_screen/login_view.dart';
import 'package:currency_converter/utils/strings.dart' as str;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// https://www.youtube.com/watch?v=omzDdNbMYGM
void main() {
  testWidgets('check errors after login', (tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen(),));

    var etEmail = find.byIcon(Icons.email);
    var etPassword = find.byIcon(Icons.account_box);
    var btnLogin = find.byType(RaisedButton);
    var tvErrorMsg = find.text(str.somethingWrong);

    expect(tvErrorMsg, findsNothing);
    expect(etEmail, findsOneWidget);
    expect(etPassword, findsOneWidget);
    expect(btnLogin, findsOneWidget);

    await tester.tap(btnLogin);
    await tester.pump();
    expect(tvErrorMsg, findsOneWidget);
  });

//  testWidgets('successful login', (tester) async {
//    await tester.pumpWidget(MaterialApp(home: LoginScreen(),));
//
//    var etEmail = find.byIcon(Icons.email);
//    var etPassword = find.byIcon(Icons.account_box);
//    var btnLogin = find.byType(RaisedButton);
//    var tvErrorMsg = find.text(str.somethingWrong);
//
//    await tester.enterText(etEmail, 'serhii');
//    await tester.pump();
//    await tester.enterText(etPassword, 'asdfasdfasfasf');
//    await tester.pump();
//    await tester.tap(btnLogin);
//    await tester.pump();
//
//    expect(tvErrorMsg, findsNothing);
//    expect(etEmail, findsNothing);
//    expect(etPassword, findsNothing);
//    expect(btnLogin, findsNothing);
//  });
}