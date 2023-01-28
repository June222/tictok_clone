import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  final ScrollController _scrollController = ScrollController();
  bool _isWriting = false;

  void _onCancelPressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = 10;
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: _onCancelPressed,
                icon: const FaIcon(FontAwesomeIcons.xmark))
          ],
          title: const Text(
            "22796 comments",
            style: TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.only(
                  left: Sizes.size10,
                  right: Sizes.size10,
                  top: Sizes.size12,
                  bottom: Sizes.size96 + Sizes.size20,
                ),
                itemCount: itemCount,
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Text(
                        "준우",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "준우",
                            style: TextStyle(
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Gaps.v4,
                          const Text(
                              "That's not it I've seen the same thing but also in a cave"),
                        ],
                      ),
                    ),
                    Gaps.h10,
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                        Gaps.v4,
                        Text(
                          "52.2K",
                          style: TextStyle(color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => Gaps.v20,
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
                      vertical: Sizes.size12,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          child: Text(
                            "준우",
                          ),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size48,
                            child: TextField(
                              onTap: _onStartWriting,
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              textInputAction: TextInputAction.newline,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: Sizes.size14,
                                  ),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.at,
                                          color: Colors.black,
                                          size: Sizes.size20,
                                        ),
                                        Gaps.h14,
                                        const FaIcon(
                                          FontAwesomeIcons.gift,
                                          color: Colors.black,
                                          size: Sizes.size20,
                                        ),
                                        Gaps.h14,
                                        const FaIcon(
                                          FontAwesomeIcons.faceSmile,
                                          color: Colors.black,
                                          size: Sizes.size20,
                                        ),
                                        if (_isWriting) Gaps.h14,
                                        if (_isWriting)
                                          GestureDetector(
                                            onTap: _stopWriting,
                                            child: FaIcon(
                                              FontAwesomeIcons.circleArrowUp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: Sizes.size20,
                                            ),
                                          ),
                                      ]),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                ),
                                hintText: "Add comments...",
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size10,
                                  vertical: Sizes.size8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class TopGreyWidget extends StatelessWidget {
  const TopGreyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Expanded(
        child: Row(children: const [
          Text(
            "Top Gifts",
            style: TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.h10,
          FaIcon(
            FontAwesomeIcons.faceSurprise,
            size: Sizes.size20,
          )
        ]),
      ),
    );
  }
}
