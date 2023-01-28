import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onChanged(String data) {}

  void _onSubmitted(String data) {}

  void _onXmarkPressed() {
    setState(() {
      // _textEditingController.text = "";
      _textEditingController.text = "";
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSettingPressed() {}

  @override
  Widget build(BuildContext context) {
    List<String> tabList = [
      "Top",
      "Users",
      "Videos",
      "Sounds",
      "LIVE",
      "Shopping",
      "Brands"
    ];

    return DefaultTabController(
      length: tabList.length,
      child: GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            title: SizedBox(
              height: Sizes.size40,
              child: TextField(
                controller: _textEditingController,
                cursorColor: Theme.of(context).primaryColor,
                expands: true,
                minLines: null,
                maxLines: null,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintText: "Search ...",
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: Sizes.size1,
                    horizontal: Sizes.size1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      top: Sizes.size12,
                      bottom: Sizes.size14,
                      left: Sizes.size12,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: Sizes.size16 + Sizes.size1,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(
                      top: Sizes.size12,
                      bottom: Sizes.size14,
                      left: Sizes.size14,
                      right: Sizes.size12,
                    ),
                    child: GestureDetector(
                      onTap: _onXmarkPressed,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        size: Sizes.size16 + Sizes.size1,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size5,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onPressed: _onSettingPressed,
                ),
              )
            ],
            bottom: TabBar(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size14,
              ),
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.black,
              tabs: [
                for (var tabName in tabList) Tab(text: tabName),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size8,
                  vertical: Sizes.size8,
                ),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 21,
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/test.gif",
                            image:
                                "https://t1.daumcdn.net/cfile/tistory/993237475E23AE5125"),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a long caption for my tiktok that im upload just now currently.",
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size1,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size12 + Sizes.size1,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/38900003?v=4",
                            ),
                            radius: Sizes.size14,
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "My Avatar is going to be very long",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size14,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.h4,
                          const Text("2.2M"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var tabName in tabList.skip(1))
                Center(
                  child: Text(
                    tabName,
                    style: const TextStyle(
                      fontSize: Sizes.size28,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
