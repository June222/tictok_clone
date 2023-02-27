import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tictok_clone/constants/gaps.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  late CameraController
      _cameraController; // 7. late로 카메라 Controller 선언 // 14. 재정의되면 안되므로 final 삭제
  bool _hasPermission = false;
  bool _isSelfiMode = false;

  @override
  void initState() {
    super.initState();
    initPermission(); // 0. initState에 선언
  }

  Future<void> initPermission() async {
    final cameraPermission = await Permission.camera.request(); // 1. 권한 얻기
    final micPermission = await Permission.microphone.request();

    final cameraDenied = cameraPermission.isDenied ||
        cameraPermission.isPermanentlyDenied; // 2. 권한 확인
    final micDinied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDinied) {
      // 3. 권한이 주어질 때만 사용하기
      _hasPermission = true;
      await initCamera(); // 4. 카메라 init
      // build에 controller.value가 있는데 initCamera되기전에 setState를 할 경우 build가 먼저 되버림... 알아두고 꼭 다음번에 쓰자.
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final camerasDescription =
        await availableCameras(); // 5. 사용 가능한 카메라 확인하기 0 => back, 1 => front
    log(camerasDescription.toString());

    if (camerasDescription.isEmpty) {
      // 6. 사용 가능한 카메라가 없을 수도 있음.
      // _noAvailableCamera = true
      return;
    }

    _cameraController = CameraController(
      // 8. 사용 가능한 카메라 중에서 하나를 골라 연결 => 그래서 late로 선언
      camerasDescription[_isSelfiMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
      // 촬영될 이미지의 화질 설정
      // Affect the quality of video recording and image capture:
      // If a preset is not available on the camera being used a preset of lower quality will be selected automatically.
    );

    await _cameraController.initialize(); // 9. camera init
  }

  Future<void> toggleSefieMode() async {
    _isSelfiMode = !_isSelfiMode;
    await initCamera(); // 12. 다시 카메라 실행
    setState(() {}); // 13. 화면에 출력
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: !_hasPermission ||
                !_cameraController.value
                    .isInitialized // 10. 권한 부여 확인 및, camera 작동 준비 완료 확인하고 실행
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Initializing Camera..."),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(
                      _cameraController), // 11. camera에 촬영되는 이미지는 CameraPreview로 확인
                  Positioned(
                    top: 100,
                    child: IconButton(
                      onPressed: toggleSefieMode,
                      icon: const Icon(Icons.cameraswitch),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
