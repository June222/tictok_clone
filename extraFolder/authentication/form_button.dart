import 'package:flutter/material.dart';

import 'package:tictok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final Widget? widget;

  const FormButton({
    super.key,
    required this.disabled,
    required this.widget,
  });

  void _onNextTap(BuildContext context) {
    if (disabled) return;
    if (widget == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onNextTap(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: Sizes.size40,
        decoration: BoxDecoration(
            color: disabled
                ? Colors.grey.shade200
                : Theme.of(context).primaryColor),
        child: Row(
          children: [
            Expanded(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: TextStyle(
                  color: disabled ? Colors.grey : Colors.white,
                ),
                textAlign: TextAlign.center,
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
