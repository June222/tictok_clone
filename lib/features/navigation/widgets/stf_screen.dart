import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/sizes.dart';
import '../plust_constant.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  late SharedPreferences prefs;
  int _clicks = 0;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final clickNumber = prefs.getInt("${widget.key}");
    if (clickNumber != null) {
      setState(() {
        _clicks = clickNumber;
      });
    } else {
      prefs.setInt("${widget.key}", 0);
    }
  }

  void _onPlusButtonTap() {
    final clickNumber = prefs.getInt("${widget.key}");
    if (clickNumber != null) {
      setState(() {
        _clicks = _clicks + PlusConst.constant;
        prefs.setInt("${widget.key}", _clicks);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState.Widget.key: ${widget.key}");
    initPrefs();
  }

  @override
  void dispose() {
    print("dispose!");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "$_clicks",
          style: const TextStyle(
            fontSize: Sizes.size40,
          ),
        ),
        TextButton(
          onPressed: _onPlusButtonTap,
          child: const Text(
            "+",
          ),
        )
      ]),
    );
  }
}
