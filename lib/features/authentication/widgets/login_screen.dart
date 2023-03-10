import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/utils/util.dart';

import 'login_form_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeURL = 'login'; // nested하게 설정을 할 경우 '/'를 쓰지않아야함.
  static const routeName = 'login';
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) async {
    // // push에 대한 설명을 읽어보면 Future<T>로 되어있다. await으로 진행하고 받고싶은 data를 전달받으면 된다.
    // final result = await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const SignUpScreen(),
    //   ),
    // );
    // log(result); // 전달받은 데이터 출력
    context.pop();
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
