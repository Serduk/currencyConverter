
// Actions type
class PerformLogin {
  const PerformLogin(this.email, this.pass, this.callback);

  final String email;
  final String pass;
  final Function callback;
}

class LoginSuccess {}