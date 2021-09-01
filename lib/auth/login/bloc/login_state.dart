abstract class LoginState {}

class LoginProgress extends LoginState {}

class LoggedOut extends LoginState {}

class LoggedIn extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}

class IdleLogin extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);
}
