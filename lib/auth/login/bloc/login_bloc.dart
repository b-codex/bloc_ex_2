import 'package:bloc_ex_2/auth/login/bloc/login_event.dart';
import 'package:bloc_ex_2/auth/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(IdleLogin());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Login) {
      final email = event.email;
      final password = event.password;

      yield LoginProgress();
      await Future.delayed(Duration(seconds: 2));
      if (email == "myemail") {
        if (password == "mypassword") {
          yield LoginSuccess('Logged In');
          // await Future.delayed(Duration(seconds: 5));
          // yield IdleLogin();
        } else {
          yield LoginFailure(message: "Incorrect Password");
          // await Future.delayed(Duration(seconds: 2));
          // yield IdleLogin();
        }
      } else {
        yield LoginFailure(message: "Account Not Found");
        // await Future.delayed(Duration(seconds: 2));
        // yield IdleLogin();
      }
      await Future.delayed(Duration(seconds: 2));
      yield LoggedOut();
    }
  }
}
