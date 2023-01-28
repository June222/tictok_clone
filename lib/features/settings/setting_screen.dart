import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notification = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      print(newValue);
      notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          CupertinoSwitch(
            // on, off
            value: notification,
            onChanged: _onNotificationChanged,
          ),
          Switch.adaptive(
            value: notification,
            onChanged: _onNotificationChanged,
          ),
          CheckboxListTile(
            value: notification,
            onChanged: _onNotificationChanged,
          ),
          CheckboxListTile(
            value: notification,
            onChanged: _onNotificationChanged,
            title: const Text("Enable settings"),
          ),
          Switch(
            value: notification,
            onChanged: _onNotificationChanged,
          ),

          const CloseButton(), // 뒤로 돌아가기
          const CupertinoActivityIndicator(
              // animating: false,
              ),
          const CircularProgressIndicator.adaptive(), // 운영체제에 맞게
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                // 달력 return
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1970),
                lastDate: DateTime(2024),
              );
              print(date);
              final time = await showTimePicker(
                // 시간 return
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = showDateRangePicker(
                // 예약 달력 return
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2024),
                builder: (context, child) {
                  return Theme(
                    // mainTheme은 안건드리고 싶을 때,
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text("When is your birthday?"),
          ),

          ListTile(
            // iOS버전
            // 알림
            onTap: () {
              showCupertinoDialog(
                // dismiss 안됨
                // 함수로 사용
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text(
                    "Are You Sure? ",
                  ),
                  content: const Text("Plz don't run away"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.staylinked,
                      ),
                    ),
                    const CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: FaIcon(
                        FontAwesomeIcons.running,
                      ),
                    ),
                  ],
                ),
              );
            },
            title: const Text(
              "Log out(iOS)",
              style: TextStyle(color: Colors.red),
            ),
          ),
          ListTile(
            // android 버전
            // 알림
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    "Are You Sure? ",
                  ),
                  content: const Text("Plz don't run away"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.staylinked,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.running,
                      ),
                    ),
                  ],
                ),
              );
            },
            title: const Text(
              "Log out(android)",
              style: TextStyle(color: Colors.red),
            ),
          ),
          ListTile(
            // iOS버전
            // 알림
            onTap: () {
              showCupertinoModalPopup(
                // 바깥 터치하면 dismiss가능
                // 함수로 사용
                context: context,
                builder: (context) => CupertinoActionSheet(
                  // 하단에서 vertical한 버튼 생성
                  title: const Text(
                    "Are You Sure? ",
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.staylinked,
                      ),
                    ),
                    const CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: FaIcon(
                        FontAwesomeIcons.running,
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("No!"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Yes!"),
                    ),
                  ],
                ),
              );
            },
            title: const Text(
              "Log out(iOS)",
              style: TextStyle(color: Colors.red),
            ),
          ),
          const AboutListTile(), // 앱의 정보와 오픈 소스 출처를 꼭 적어야함.
        ],
      ),
    );
  }
}
// body: SizedBox(
//         height: MediaQuery.of(context).size.height / 10,
//         child: ListWheelScrollView(
//           diameterRatio: 1,
//           // useMagnifier: true,
//           magnification: 1.5,
//           // offAxisFraction: 1.5,
//           itemExtent: 40,
//           children: [
//             for (var x in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
//               FractionallySizedBox(
//                 widthFactor: 0.8,
//                 child: Container(
//                   alignment: Alignment.center,
//                   // color: Colors.teal,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade600,
//                     border: Border.all(color: Colors.grey.shade500),
//                     borderRadius: BorderRadius.circular(
//                       10,
//                     ),
//                   ),
//                   child: Text(
//                     "Pick me $x",
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: Sizes.size18,
//                     ),
//                   ),
//                 ),
//               )
//           ],
//         ),
//       ),