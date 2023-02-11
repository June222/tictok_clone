import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/utils/util.dart';

import 'login_form_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    void _onLoginFormTap(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginFormScreen(),
        ),
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: isDarkMode(context) ? null : Colors.grey.shade100,
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
                  onTap: () => _onSignUpTap(context),
                  child: Text(
                    "Sign Up",
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
                  "Login for TicTok",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                Gaps.v40,
                GestureDetector(
                  onTap: () => _onLoginFormTap(context),
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
        ));
  }
}
