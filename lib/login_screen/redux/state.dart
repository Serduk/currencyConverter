import 'package:meta/meta.dart';

// List of currencyes objects
@immutable
class AppState {
  const AppState({this.isLogged});

  final bool isLogged;
}