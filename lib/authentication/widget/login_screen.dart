import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/authentication/widget/signup_button.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUPTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
          vertical: Sizes.size16,
        ),
        child: Column(
          children: [
            const Text(
              "Login for TikTok",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size24,
              ),
            ),
            Gaps.v16,
            Text(
              "Create a profile, follow other acounts, make your own videos, and more.",
              style: TextStyle(
                fontSize: Sizes.size14,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v24,
            const SignUpButton(
              icon: FontAwesomeIcons.user,
              text: "Use phone or email",
            ),
            Gaps.v14,
            const SignUpButton(
              icon: FontAwesomeIcons.facebook,
              text: "Continue with Facebook",
            ),
            Gaps.v14,
            const SignUpButton(
              icon: FontAwesomeIcons.apple,
              text: "Continue with Apple",
            ),
            Gaps.v14,
            const SignUpButton(
              icon: FontAwesomeIcons.google,
              text: "Continue with Google",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        color: Colors.grey.shade100,
        child: SizedBox(
          height: Sizes.size96,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUPTap(context),
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
