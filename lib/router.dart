import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/authentication/username_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/login_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/sign_up_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: UserNameScreen.routeName,
      builder: (context, state) => const UserNameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
  ],
);
