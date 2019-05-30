import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

//work with async data
class LoginMiddleware implements MiddlewareClass<AppState> {
  LoginMiddleware(
//      this.model
      );

  //final LoginModel model;

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if(action is PerformLogin) {
//      FAKE LOGIN
    // post login request
     // myservice.post(action.email, action.pass)
      // get successful response
      action.callback();
    store.dispatch(LoginSuccess());
    }
    next(action);
  }
}

class FetchDataMiddleware implements MiddlewareClass<AppState> {
  FetchDataMiddleware(

      );

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if(action is FetchData) {
      action.callback();
//      store.dispatch(FetchData(SetDataList.data));
    }
  }
}