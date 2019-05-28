import 'package:meta/meta.dart';

@immutable
class AppState {
  const AppState({this.isLogged});

  final bool isLogged;
}