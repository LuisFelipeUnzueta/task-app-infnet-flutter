import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_infnet/providers/auth_provider.dart';
import 'package:task_app_infnet/routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
              authProvider.signUp(email, password).then((sucsses) {
                if (sucsses) {
                  Navigator.pushReplacementNamed(context, Routes.HOME);
                }
              });
            },
            child: const Text('Sign up')),
        if (authProvider.message != null) Text(authProvider.message!),
      ]),
    );
  }
}
