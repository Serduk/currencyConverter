
// Actions type
import 'package:currency_converter/entity/Currency.dart';

class PerformLogin {
  const PerformLogin(this.email, this.pass, this.callback);

  final String email;
  final String pass;
  final Function callback;
}

class LoginSuccess {}

class FetchData {
  const FetchData(this.callback);
  final Function callback;
}

class SetDataList {
  const SetDataList(this.data);
  final List<CurrencyEntity> data;
}