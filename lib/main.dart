import 'package:flutter/material.dart';
import 'package:tictok_clone/features/navigation/main_navigation_screen.dart';

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
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromARGB(179, 241, 71, 41),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(179, 241, 71, 41),
        ),
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromARGB(179, 241, 71, 41),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
      ),
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
