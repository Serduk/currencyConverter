import 'package:currency_converter/entity/Currency.dart';
import 'package:meta/meta.dart';

// List of currencyes objects
@immutable
class AppState {
  const AppState({this.isDataFetched, this.items, this.isLogged});

  final bool isLogged;
  final bool isDataFetched;

  final List<CurrencyEntity> items;
}