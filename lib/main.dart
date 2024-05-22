import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_infnet/providers/auth_provider.dart';
import 'package:task_app_infnet/providers/task_provider.dart';
import 'package:task_app_infnet/routes.dart';
import 'package:task_app_infnet/screens/about_screen.dart';
import 'package:task_app_infnet/screens/details_screen.dart';
import 'package:task_app_infnet/screens/home_screen.dart';
import 'package:task_app_infnet/screens/signin_screen.dart';
import 'package:task_app_infnet/screens/signup_screen.dart';
import 'package:task_app_infnet/screens/task_insert_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Task App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        routes: {
          Routes.SIGNIN: (context) => SigninScreen(),
          Routes.SIGNUP: (context) => SignupScreen(),
          Routes.HOME: (context) => HomeScreen(),
          Routes.ABOUT: (context) => AboutScreen(),
          Routes.DETAILS: (context) => DetailsScreen(),
          Routes.FORM: (context) => TaskInsertScreen(),
        },
      ),
    );
  }
}
