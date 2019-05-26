import 'package:meta/meta.dart';

@immutable
class AppState {
  const AppState({this.login, this.password});

  const AppState.initial() : login = '', password = '';

  final String login;
  final String password;
}