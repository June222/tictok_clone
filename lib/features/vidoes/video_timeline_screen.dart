import 'package:flutter/material.dart';

import 'widget/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController =
      PageController(); // # 2: pageController 생성
  int _itemCount = 4;

  final Duration _scrollDuration = const Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      // # 4: 모든 화면에 page 위치, 전환 애니메이션, 지속시간 설정
      page,
      curve: _scrollCurve,
      duration: _scrollDuration,
    );
    if (page == _itemCount - 1) {
      // # 5: page의 끝에 왔을 때,
      setState(() {
        // # 7: setState()
        _itemCount = _itemCount + 4; // # 6: 보여줄 페이지수를 늘리고
      });
    }
  }

  void _onVideoFinished() {
    return;
    // # 8: 페이지 전환은 pageController가 하기 때문에 여기서 정의
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        // # 1.1: 데이터를 저장해두지 않고 필요할 때만 렌더링시키는 method
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged, // # 3: page 변환이 인식될 때 함수 실행시키기
        itemCount: _itemCount, // # 1.2: 렌더링할 page 수
        itemBuilder: (context, index) => VideoPost(
            onVideoFinished: _onVideoFinished, index: index), // # 9: 인자로 전달
      ),
    );
  }
}
