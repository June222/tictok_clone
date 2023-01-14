import 'package:flutter/material.dart';
import 'package:tictok_clone/authentication/widget/signup_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TicTok App",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 199, 38, 164),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}
