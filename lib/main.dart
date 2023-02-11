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
          displayLarge: GoogleFonts.raleway(
            fontSize: 99,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          displayMedium: GoogleFonts.raleway(
            fontSize: 62,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          displaySmall:
              GoogleFonts.raleway(fontSize: 49, fontWeight: FontWeight.w400),
          headlineMedium: GoogleFonts.raleway(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headlineSmall:
              GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.w400),
          titleLarge: GoogleFonts.raleway(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          titleMedium: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          titleSmall: GoogleFonts.raleway(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyLarge: GoogleFonts.splineSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.splineSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          labelLarge: GoogleFonts.splineSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          bodySmall: GoogleFonts.splineSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelSmall: GoogleFonts.splineSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromARGB(179, 241, 71, 41),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
