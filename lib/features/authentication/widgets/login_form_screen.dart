import 'package:flutter/material.dart';
import 'package:tictok_clone/features/onboarding/interests_screen.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
          vertical: Sizes.size16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v40,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "fill the blank";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  formData['email'] = newValue!;
                },
              ),
              Gaps.v4,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value == null) {
                    return "fill the blank";
                  }
                  if (value != "1234") {
                    return "Wrong Password";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  formData['password'] = newValue!;
                },
              ),
              Gaps.v32,
              GestureDetector(
                onTap: _onSubmitTap,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    height: Sizes.size40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // const FormButton(
              //   disabled: false,
              //   widget: null,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
