import 'package:currency_converter/currency_screen/currency_model.dart';

abstract class CurrencyView {
  void refreshCurrency();

  void calculateCurrency();

  void showCountryDetails();

  void displayCurrencyList();

  void recalculateCurrencies();

  void navigateToLogin();
}

class CurrencyPresenter {
  CurrencyPresenter(this.model);

  CurrencyView view;
  final CurrencyModel model;
}
