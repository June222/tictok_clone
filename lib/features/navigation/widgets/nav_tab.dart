import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatelessWidget {
  final String text;
  final IconData iconSelected;
  final IconData iconUnselected;
  final bool isSelected;
  final Function onTap;
  final bool inverted;

  const NavTab({
    Key? key,
    required this.text,
    required this.iconSelected,
    required this.isSelected,
    required this.onTap,
    required this.iconUnselected,
    required this.inverted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: !inverted ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 300,
            ),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? iconSelected : iconUnselected,
                  color: !inverted ? Colors.white : Colors.black,
                ),
                Gaps.v4,
                Text(
                  text,
                  style: TextStyle(
                    color: !inverted ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
