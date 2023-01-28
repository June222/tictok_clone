import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/features/discover/discover_screen.dart';
import 'package:tictok_clone/features/inbox/inbox_screen.dart';
import 'package:tictok_clone/features/navigation/widgets/nav_tab.dart';
import 'package:tictok_clone/features/vidoes/video_timeline_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../users/user_profile_screen.dart';
import 'plust_constant.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;
  bool _isTapUp = true;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onVideoTap() {}

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isTapUp = true;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isTapUp = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isTapUp = false;
    });
  }

  void _onDoubleTap() {
    PlusConst().changeState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size10,
          ),
          child: Row(
            children: [
              NavTab(
                text: "home",
                iconSelected: FontAwesomeIcons.houseChimneyUser,
                iconUnselected: FontAwesomeIcons.houseChimney,
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
                inverted: _selectedIndex != 0,
              ),
              NavTab(
                text: "Discover",
                iconSelected: FontAwesomeIcons.solidCompass,
                iconUnselected: FontAwesomeIcons.compass,
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
                inverted: _selectedIndex != 0,
              ),
              Gaps.h12,
              GestureDetector(
                onTapUp: (details) => _onTapUp(details),
                onTapDown: (details) => _onTapDown(details),
                // onTap: () => _onVideoTap(),
                onTapCancel: () => _onTapCancel(),
                // onDoubleTap: () => _onDoubleTap(),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 5,
                      child: Container(
                        height: Sizes.size32,
                        width: Sizes.size36,
                        decoration: BoxDecoration(
                          color: _isTapUp ? Colors.blue : Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      child: Container(
                        height: Sizes.size32,
                        width: Sizes.size36,
                        decoration: BoxDecoration(
                          color: _isTapUp ? Colors.red : Colors.red.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    AnimatedCrossFade(
                      firstChild: Container(
                        height: Sizes.size32,
                        width: Sizes.size36,
                        decoration: BoxDecoration(
                          color:
                              _selectedIndex == 0 ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      secondChild: Container(
                        height: Sizes.size32,
                        width: Sizes.size32,
                        decoration: BoxDecoration(
                          color:
                              _selectedIndex == 0 ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      crossFadeState: _isTapUp
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: _isTapUp ? Sizes.size20 : Sizes.size16,
                      color: _selectedIndex == 0 ? Colors.black : Colors.white,
                    ),
                  ],
                ),
              ),
              Gaps.h12,
              NavTab(
                text: "Inbox",
                iconSelected: FontAwesomeIcons.solidMessage,
                iconUnselected: FontAwesomeIcons.message,
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
                inverted: _selectedIndex != 0,
              ),
              NavTab(
                text: "Profile",
                iconSelected: FontAwesomeIcons.user,
                iconUnselected: FontAwesomeIcons.solidCircleUser,
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
                inverted: _selectedIndex != 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
