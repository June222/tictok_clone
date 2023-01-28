import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  final List<String> _autoFillHints = ["123", "1234", "12345"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: ListTile(
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 15,
                  foregroundImage: NetworkImage(
                      "https://d1telmomo28umc.cloudfront.net/media/public/avatars/June222-avatar.jpg"),
                ),
                Positioned(
                  right: -3,
                  bottom: -3,
                  child: Container(
                    width: Sizes.size14,
                    height: Sizes.size14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size2,
                      ),
                    ),
                  ),
                )
              ],
            ),
            title: const Text(
              "준우",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text("active now"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h20,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(
                Sizes.size10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                bool isMine = index % 2 == 0;
                return Row(
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size10,
                      ),
                      decoration: BoxDecoration(
                        color: isMine
                            ? Theme.of(context).primaryColor
                            : Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size10,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size10,
                          ),
                          bottomRight: isMine
                              ? Radius.zero
                              : const Radius.circular(
                                  Sizes.size10,
                                ),
                          bottomLeft: isMine
                              ? const Radius.circular(
                                  Sizes.size10,
                                )
                              : Radius.zero,
                        ),
                      ),
                      child: const Text(
                        "Here's message",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: BottomAppBar(
                elevation: 10,
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: Sizes.size8,
                    left: Sizes.size8,
                    right: Sizes.size8,
                    bottom: Sizes.size40,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: Sizes.size36,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size14,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.size20),
                              topRight: Radius.circular(Sizes.size20),
                              bottomLeft: Radius.circular(Sizes.size20),
                            ),
                          ),
                          child: TextField(
                            autofillHints: _autoFillHints,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: Sizes.size16,
                              ),
                              hintText: "Send a message...",
                              suffixIconConstraints:
                                  BoxConstraints.tightFor(width: Sizes.size24),
                              suffixIcon: FaIcon(
                                FontAwesomeIcons.faceSmile,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gaps.h10,
                      Container(
                        height: Sizes.size32,
                        width: Sizes.size32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.solidPaperPlane,
                            size: Sizes.size18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
