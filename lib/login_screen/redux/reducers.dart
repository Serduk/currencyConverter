import 'actions.dart';
import 'state.dart';

AppState appState(AppState appState, action) => AppState(
  login: _login(appState.login, appState.password, action),
);

String _login(String log, String pass, action) {
  if(action is PerformLogin) {
    return action.value;
  }

  return 'Oops';
}