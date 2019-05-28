import 'actions.dart';
import 'state.dart';

AppState appState(AppState appState, action) => AppState(
      isLogged: _isLogged(appState.isLogged, action),
    );

bool _isLogged(bool old, action) {
  if (action is LoginSuccess) {
    return true;
  }
  return old;
}
