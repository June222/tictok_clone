import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/username_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/features/authentication/widgets/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeURL = '/';
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    // // pop()안에 return 하고싶은 데이터를 넣으면 된다.
    // Navigator.of(context).pop("popped!");

    context.pushNamed(LoginScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) =>
    //         const UserNameScreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       final offsetAnimation = Tween(
    //         begin: const Offset(1, 0),
    //         end: const Offset(0, 0),
    //       ).animate(animation);
    //       final fadeAnimationFromPointFive = Tween(
    //         begin: 0.5,
    //         end: 1.0,
    //       ).animate(animation);
    //       return FadeTransition(
    //         opacity: fadeAnimationFromPointFive,
    //         child: SlideTransition(
    //           position: offsetAnimation,
    //           child: child,
    //         ),
    //       );
    //     },
    //   ),
    // );

    context.push(UserNameScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        // device의 상단바에 가리지않는 부분부터 시작하기.
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Sign up for TicTok",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailTap(context),
                child: const AuthButton(
                    icon: FaIcon(FontAwesomeIcons.user),
                    text: "Use email & password"),
              ),
              Gaps.v10,
              const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple"),
            ],
          ),
        ),
      ),
    );
  }
}
