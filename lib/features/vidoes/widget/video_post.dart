import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/features/vidoes/widget/video_button.dart';
import 'package:tictok_clone/features/vidoes/widget/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished; // # 10.1: nextPage()를 받기
  final int index;
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;
  bool _isPaused = false;
  bool _fullCaption = true;
  final String _caption =
      "Caption that has very long caption blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah blahblah ";

  final Duration _animationDuration = const Duration(milliseconds: 200);
  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      // # 19: 실행되었을 때,
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        // # 20: 영상의 길이와 재생 위치가 같을 때, => 종료시점
        widget.onVideoFinished(); // # 21: 동영상 종료 시점에 _pageController.nextPage()
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.asset(
        "assets/videos/smart_watch.mp4"); // # 10.2: VideoController 정의

    await _videoPlayerController
        .initialize(); // # 12: await videoPlayerController.initialize()
    // _videoPlayerController.play(); // # 13: VideoController 작동

    await _videoPlayerController.setLooping(true);

    setState(() {}); // # 14: setState()
    _videoPlayerController
        .addListener(_onVideoChange); // # 18: 동영상이 끝나면 다음 동영상 보여주기
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer(); // # 11: initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }

    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      // 화면 넘길 때 동영상 종료시키기
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _animationController.reverse();
      } else {
        _videoPlayerController.play();
        _animationController.forward();
      }
      setState(() {
        _isPaused = !_isPaused;
      });
    });
  }

  void _onSeeMoreTap() {
    setState(() {
      _fullCaption = !_fullCaption;
    });
  }

  void _onCommentsTap(BuildContext context) {
    // _onTogglePause();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const VideoComments(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            // # 15: stack에서 화면 가득 채우기
            child: _videoPlayerController.value.isInitialized // # 16: 썸네일로 가능?
                ? VideoPlayer(_videoPlayerController) // # 17: 동영상을 보여주는 Widget
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(onTap: _onTogglePause),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size64,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@스마트워치",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                const Text(
                  "This is my new watch i received for nothing!!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size14,
                  ),
                ),
                Gaps.v4,
                SizedBox(
                  width: 300,
                  child: AnimatedCrossFade(
                    crossFadeState: _fullCaption
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 100),
                    firstChild: Text(
                      _caption,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size14,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    secondChild: Wrap(
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            _caption,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: _onSeeMoreTap,
                          child: const Text(
                            "See More",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/38900003?v=4"),
                  ),
                  Gaps.v32,
                  const VideoButton(
                      icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                  Gaps.v32,
                  GestureDetector(
                    onTap: () => _onCommentsTap(context),
                    child: const VideoButton(
                        icon: FontAwesomeIcons.solidComment, text: "2.1K"),
                  ),
                  Gaps.v32,
                  const VideoButton(icon: FontAwesomeIcons.share, text: "share")
                ],
              ))
        ],
      ),
    );
  }
}
