import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const SignUpButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: Sizes.size40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size10,
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  FaIcon(
                    icon,
                    size: Sizes.size24,
                  ),
                  Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
