import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_infnet/providers/auth_provider.dart';
import 'package:task_app_infnet/routes.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              authProvider.signIn(email, password).then((sucsses) {
                if (sucsses) {
                  Navigator.pushReplacementNamed(context, Routes.HOME);
                }
              });
            },
            child: const Text('Sign in')),
        if (authProvider.message != null) Text(authProvider.message!),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Divider(
            height: 2,
          ),
        ),
        const Text('If you are not registered yet, click in:'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.SIGNUP);
            },
            child: const Text('Sign up'))
      ]),
    );
  }
}
