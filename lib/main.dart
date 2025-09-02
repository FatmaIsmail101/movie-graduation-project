import 'package:flutter/material.dart';
import 'package:movies/forget_password_screen.dart';
import 'package:movies/utils/app_routes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgetPasswordScreen(),
      routes: {
        AppRoutes.forgetPasswordRouteName: (context) =>
        const ForgetPasswordScreen(),
      },
    );
  }
}
