import 'package:redux/redux.dart';

import '../login_model.dart';
import 'actions.dart';
import 'state.dart';

class LoginMiddleware implements MiddlewareClass<AppState> {
  LoginMiddleware(this.model);

  final LoginModel model;

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if(action is Login) {
//      model.login.then((message) => store.dispatch(PerformLogin(message)));
    print('Perform Login');
    }

    if(action is Logout) {

    }

    next(action);
  }
}