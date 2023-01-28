import 'package:flutter/material.dart';
import '../../../extraFolder/authentication/form_button.dart';
import '../../../extraFolder/authentication/widget/login_screen.dart';

import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final _initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _setDateController(DateTime dateTime) {
    final text = dateTime.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: text);
  }

  void _onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "When's your birthday?",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.v14,
                      Text("Your birthday won't be shown publcily.")
                    ],
                  ),
                  // const FaIcon(FontAwesomeIcons.birthdayCake)
                  const Icon(
                    Icons.cake_rounded,
                    size: Sizes.size64,
                  )
                ],
              ),
              Gaps.v20,
              TextField(
                onEditingComplete: () => _onNextTap(context),
                keyboardType: TextInputType.emailAddress,
                controller: _birthdayController,
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
              const FormButton(
                disabled: false,
                widget: LoginScreen(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size28,
          ),
          child: CalendarDatePicker(
            initialDate: _initialDate,
            firstDate: DateTime.now().subtract(
              const Duration(days: 365 * 100),
            ),
            lastDate: _initialDate,
            onDateChanged: _setDateController,
          ),
        )),
      ),
    );
  }
}
