import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../lib/constants/sizes.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Widget screen;
  final BuildContext context;

  const AuthButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.screen,
    required this.context,
  }) : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  void _onButtonTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => widget.screen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonTap(widget.context),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: Sizes.size44,
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
                      widget.icon,
                      size: Sizes.size24,
                    ),
                    Center(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.size1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
