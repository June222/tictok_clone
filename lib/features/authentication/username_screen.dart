import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/authentication/widgets/formbutton.dart';
import 'package:tictok_clone/utils/util.dart';

import 'widgets/email_screen.dart';

class UserNameScreen extends StatefulWidget {
  static const String routeName = '/username';

  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void onNextTap() {
    if (_username.isEmpty) {
      return;
    }
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const EmailScreen(),
    //   ),
    // );
    // Navigator.of(context).pushNamed(
    //   EmailScreen.routeName,
    //   arguments: EmailScreenArgs(username: _username),
    // );
    context.push(EmailScreen.routeName,
        extra: EmailScreenArgs(username: _username));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "Create User Name",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v10,
            Text(
              "You can always change this year.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: isDark ? Colors.white : Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "UserName",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
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
            Gaps.v16,
            GestureDetector(
              onTap: onNextTap,
              child: FormButton(disabled: _username.isEmpty),
            ),
          ],
        ),
      ),
    );
  }
}
