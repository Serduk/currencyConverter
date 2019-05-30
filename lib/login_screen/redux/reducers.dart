import 'package:currency_converter/entity/Currency.dart';

import 'actions.dart';
import 'state.dart';

// change state, return new state of some param
AppState appState(AppState appState, action) => AppState(
      isLogged: _isLogged(appState.isLogged, action),
    );

bool _isLogged(bool old, action) {
  if (action is LoginSuccess) {
    return true;
  }
  return old;
}

bool _isDateFetched(bool old, action) {
  return old;
}

List<CurrencyEntity> _getCurrencies(List<CurrencyEntity> old, action) {
  if (action is FetchData) {
  }
  return old;
}
