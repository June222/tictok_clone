import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../extraFolder/authentication/form_button.dart';
import '../../../extraFolder/authentication/widget/birthday_screen.dart';
import '../../../extraFolder/authentication/widget/login_screen.dart';

import '../../../lib/constants/gaps.dart';
import '../../../lib/constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    if (_password.isEmpty || _password.length < 8) return false;
    return true;
  }

  void _onNextTap(BuildContext context) {
    if (!_isPasswordValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size28,
          vertical: Sizes.size32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create password",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v20,
            TextField(
              onEditingComplete: () => _onNextTap(context),
              keyboardType: TextInputType.emailAddress,
              controller: _passwordController,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade200,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v20,
            const Text(
              "Your password must have:",
              style: TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v16,
            Row(
              children: [
                Gaps.v10,
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size16,
                  color: _isPasswordValid() ? Colors.green : Colors.black,
                ),
                Gaps.h10,
                const Text(
                  "8 to 20 Characters",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
              ],
            ),
            Gaps.v10,
            Row(
              children: const [
                Gaps.v10,
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.size16,
                ),
                Gaps.h10,
                Text(
                  "Letters, numbers, and special characters",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
              ],
            ),
            Gaps.v20,
            FormButton(
              disabled: _password.isEmpty || !_isPasswordValid(),
              widget: const BirthdayScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
