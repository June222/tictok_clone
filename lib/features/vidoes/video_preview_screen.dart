import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  const VideoPreviewScreen({super.key, required this.video});
  final XFile video; // 전달 받은 비디오 파일 정보
  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController; // 실행시키기 위한 비디오 컨트롤러

  @override
  void initState() {
    super.initState();
    initVideoPlayerController(); // 다른 컨트롤러와 마찬가지로 initState시에 initialize 해주어야함.
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> initVideoPlayerController() async {
    _videoPlayerController = VideoPlayerController.file(
      File(widget.video.path), // 실행시킬 비디오 파일의 directory를 설정!!
    );

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();

    setState(() {}); // 이거 하지않으면 화면 재생이 안됨.
  }

  @override
  Widget build(BuildContext context) {
    log(widget.video.path);
    return Scaffold(
      appBar: AppBar(title: const Text("Preview Video")),
      body: _videoPlayerController.value.isInitialized
          ? VideoPlayer(
              _videoPlayerController) // type(VideoPlayer) == Widget 임.
          : const Text("No Video"),
    );
  }
}
