import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictok_clone/features/authentication/widgets/login_screen.dart';

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
        textTheme: TextTheme(
          displayLarge: GoogleFonts.ubuntu(
              fontSize: 99, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: GoogleFonts.ubuntu(
              fontSize: 62, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall:
              GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
          headlineMedium: GoogleFonts.ubuntu(
              fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall:
              GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w400),
          titleLarge: GoogleFonts.ubuntu(
              fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          titleMedium: GoogleFonts.ubuntu(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          titleSmall: GoogleFonts.ubuntu(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyLarge: GoogleFonts.robotoSlab(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: GoogleFonts.robotoSlab(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          labelLarge: GoogleFonts.robotoSlab(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          bodySmall: GoogleFonts.robotoSlab(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelSmall: GoogleFonts.robotoSlab(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromARGB(179, 241, 71, 41),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.ubuntu(
              fontSize: 99, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: GoogleFonts.ubuntu(
              fontSize: 62, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall:
              GoogleFonts.ubuntu(fontSize: 49, fontWeight: FontWeight.w400),
          headlineMedium: GoogleFonts.ubuntu(
              fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall:
              GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w400),
          titleLarge: GoogleFonts.ubuntu(
              fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          titleMedium: GoogleFonts.ubuntu(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          titleSmall: GoogleFonts.ubuntu(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyLarge: GoogleFonts.robotoSlab(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: GoogleFonts.robotoSlab(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          labelLarge: GoogleFonts.robotoSlab(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          bodySmall: GoogleFonts.robotoSlab(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelSmall: GoogleFonts.robotoSlab(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
