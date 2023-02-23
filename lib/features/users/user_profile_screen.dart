import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/features/settings/setting_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import 'widgets/follower_info_tap.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  const UserProfileScreen({super.key, required this.username});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _animationControllerList.add(_animationController);
    // _animationControllerList.add(_animationController2);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(FontAwesomeIcons.gear),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        foregroundImage: NetworkImage(
                            "https://media.contentapi.ea.com/content/dam/gin/images/2018/03/fifa-online-4-key-art.jpg.adapt.crop3x5.533p.jpg"),
                      ),
                      Gaps.v3,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "@${widget.username}",
                            style: const TextStyle(
                              fontSize: Sizes.size18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.blue.shade500,
                          ),
                        ],
                      ),
                      Gaps.v20,
                      SizedBox(
                        height: Sizes.size56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FollwerInfoTap(
                              tabNumber: "97",
                              tabName: "Follwing",
                            ),
                            VerticalDivider(
                              width: 30,
                              color: Colors.grey.shade500,
                              indent: 10,
                              endIndent: 10,
                            ),
                            const FollwerInfoTap(
                              tabNumber: "10M",
                              tabName: "Followers",
                            ),
                            VerticalDivider(
                              width: 30,
                              color: Colors.grey.shade500,
                              indent: 10,
                              endIndent: 10,
                            ),
                            const FollwerInfoTap(
                              tabNumber: "194.3M",
                              tabName: "Likes",
                            )
                          ],
                        ),
                      ),
                      Gaps.v20,
                      FractionallySizedBox(
                        widthFactor: 0.4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size14,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Gaps.v20,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size24,
                        ),
                        child: Text(
                          "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                      Gaps.v8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size18,
                          ),
                          Gaps.h10,
                          Text(
                            "https://github.com/June222",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v8,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 9 / 14,
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 14,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/test.gif",
                            image:
                                "https://avatars.githubusercontent.com/u/38900003?v=4"),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text("Page two"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//   with TickerProviderStateMixin {
// late final TabController _tabController = TabController(
//   length: 2,
//   vsync: this,
// );

// late final AnimationController _animationController = AnimationController(
//   vsync: this,
//   duration: const Duration(
//     milliseconds: 300,
//   ),
// );

// late final AnimationController _animationController2 = AnimationController(
//   vsync: this,
//   duration: const Duration(
//     milliseconds: 300,
//   ),
// );

// late final List<AnimationController> _animationControllerList = [];

// late final Animation<Color?> _animation = ColorTween(
//   begin: Colors.grey,
//   end: Colors.black,
// ).animate(_animationController);
// late final Animation<Color?> _animation2 = ColorTween(
//   begin: Colors.grey,
//   end: Colors.black,
// ).animate(_animationController2);

// int _selectedTabIndex = 0;

// @override
// void initState() {
//   super.initState();
//   _tabController.addListener(() {
//     setState(() {
//       _animationControllerList[_selectedTabIndex].reverse();
//       _selectedTabIndex = _tabController.index;
//       _animationControllerList[_selectedTabIndex].forward();
//     });
//   });
//   _animationController.addListener(() {
//     setState(() {});
//   });
//   _animationController2.addListener(() {
//     setState(() {});
//   });
// }

// @override
// void dispose() {
//   _tabController.dispose();
//   _animationController.dispose();
//   _animationController2.dispose();
//   super.dispose();
// }

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: const TabBar(
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size8,
        ),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label, // tabBar 아래에 밑줄 길이 설정
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size14,
            ),
            child: FaIcon(
              FontAwesomeIcons.gripVertical,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size14,
            ),
            child: FaIcon(
              FontAwesomeIcons.heart,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 43;

  @override
  double get minExtent => 43;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}




// class CustomDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return FractionallySizedBox(
//       heightFactor: 1,
//       child: Container(
//         alignment: Alignment.center,
//         color: Colors.indigoAccent,
//         child: const Text(
//           "Title!!",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 150;

//   @override
//   double get minExtent => 80;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }


// SliverAppBar(
//           backgroundColor: Colors.teal,
//           collapsedHeight: 80,
//           expandedHeight: 300,
//           flexibleSpace: FlexibleSpaceBar(
//             centerTitle: true,
//             stretchModes: const [
//               StretchMode.blurBackground,
//             ],
//             background: Image.asset(
//               "assets/images/city.jpg",
//               fit: BoxFit.cover,
//             ),
//             title: const Text("hello!"),
//           ),
//         ),
//         const SliverToBoxAdapter(
//           child: CircleAvatar(
//             backgroundColor: Colors.grey,
//           ),
//         ),
//         SliverFixedExtentList(
//           delegate: SliverChildBuilderDelegate(
//             childCount: 50,
//             (context, index) => Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.amber[100 * (index % 9)],
//               ),
//               child: Text("Hello World! #$index"),
//             ),
//           ),
//           itemExtent: 100,
//         ),
//         SliverPersistentHeader(
//           delegate: CustomDelegate(),
//           pinned: true,
//           floating: true,
//         ),
//         SliverGrid(
//           delegate: SliverChildBuilderDelegate(
//             childCount: 50,
//             (context, index) => Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.cyan[100 * (index % 9)],
//               ),
//               child: Text("Hello World! #$index"),
//             ),
//           ),
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             crossAxisSpacing: Sizes.size10,
//             mainAxisSpacing: Sizes.size28,
//             maxCrossAxisExtent: 100,
//             childAspectRatio: 16 / 9,
//           ),
//         ),
