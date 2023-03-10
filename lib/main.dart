import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictok_clone/router.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "TicTok App",
      routerConfig: router,
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
          textTheme: GoogleFonts.itimTextTheme()),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromARGB(179, 241, 71, 41),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
        textTheme: GoogleFonts.itimTextTheme(
          // font 설정하는 방법
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
      // home: const LoginScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
