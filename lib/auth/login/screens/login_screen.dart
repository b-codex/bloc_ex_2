import 'package:bloc_ex_2/auth/login/bloc/login_bloc.dart';
import 'package:bloc_ex_2/auth/login/bloc/login_event.dart';
import 'package:bloc_ex_2/auth/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(border: OutlineInputBorder());
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: textFieldDecoration.copyWith(hintText: 'Email'),
              controller: emailController,
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: textFieldDecoration.copyWith(hintText: 'Password'),
              controller: passwordController,
            ),
            SizedBox(height: 10),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginProgress) {
                  return OutlinedButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(),
                        ),
                        Text('Logging In'),
                      ],
                    ),
                  );
                }
                if (state is LoginFailure) {
                  final String message = state.message;
                  return OutlinedButton(
                    onPressed: null,
                    child: Text(message),
                  );
                }
                if (state is LoginSuccess) {
                  final String message = state.message;
                  return OutlinedButton(
                    onPressed: null,
                    child: Text(message),
                  );
                }
                if (state is IdleLogin) {
                  return OutlinedButton(
                    onPressed: () {
                      final bloc = BlocProvider.of<LoginBloc>(context);
                      bloc.add(Login(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                    child: Text('Login'),
                  );
                }
                return OutlinedButton(
                  onPressed: () {
                    final bloc = BlocProvider.of<LoginBloc>(context);
                    bloc.add(Login(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                  child: Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
