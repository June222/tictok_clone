import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/features/vidoes/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  // 1. Observer mixin 사용
  // 버튼을 누르면 확대되는 애니메이션
  late final AnimationController _buttonAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 200));

  // 별도의 애니메이션 정의 없이 controller로 바로 사용
  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 100),
    lowerBound: 0.0, // 원하는 값을 controller 정의시에 bound 값에 begin, end 대신 넣음
    upperBound: 1.0,
  );

  // 시작에서 확대
  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  late CameraController
      _cameraController; // 7. late로 카메라 Controller 선언 // 14. 재정의되면 안되므로 final 삭제

  late FlashMode _flashMode; // 15. camera init후에 사용하여야 하기때문에 late
  bool _hasPermission = false;
  bool _isSelfiMode = false;
  late final double _maxZoomLevel;
  late final double _minZoomLevel;
  Offset _offsetIncrement = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    initPermission(); // 0. initState에 선언
    WidgetsBinding.instance.addObserver(this); // 2. initState에서 화면 이탈을 체크
    // 진행 상황을 실시간으로 변경
    _progressAnimationController.addListener(() {
      setState(() {});
    });

    // 정해진 Timer가 끝나면 종료
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _buttonAnimationController.dispose();
    _cameraController.dispose();

    super.dispose();
  }

  /// pub.dev 공식 문서
  /// ```
  /// @override
  /// void didChangeAppLifecycleState(AppLifecycleState state) {
  ///   final CameraController? cameraController = controller;
  ///
  ///   // App state changed before we got the chance to initialize.
  ///   if (cameraController == null || !cameraController.value.isInitialized) {
  ///     return;
  ///   }
  ///
  ///   if (state == AppLifecycleState.inactive) {
  ///     cameraController.dispose();
  ///   } else if (state == AppLifecycleState.resumed) {
  ///     onNewCameraSelected(cameraController.description);
  ///   }
  /// }
  /// ```

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null) return;
    // 권한 획득 화면에서 이 Method가 호출되는데 이는 initPermission중에 호출되는 것이며 initCamera되기 전이기 때문에 controller가 null임
    // pub.dev의 공식문서의 readme에도 코드가 있음.
    if (!_cameraController.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      // 3. 화면 이탈시에 (기본 home 버튼으로 종료하지 않고, backgroud로 빠져나가기) controller를 dispose
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera(); // 4. 복귀하면 새로운 카메라를 정의, _cameraController.initialized();
    }
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
    await _cameraController
        .prepareForVideoRecording(); // ios에서 발생하는 오디오와 비디오의 싱크문제를 해결하는 코드, android나 웹에서는 아무것도 실행되지 않는다.
    _flashMode = _cameraController.value.flashMode;
    _maxZoomLevel = await _cameraController.getMaxZoomLevel();
    _minZoomLevel = await _cameraController.getMinZoomLevel();

    log(_maxZoomLevel.toString());
    log(_minZoomLevel.toString());

    setState(() {});
  }

  Future<void> toggleSefieMode() async {
    _isSelfiMode = !_isSelfiMode;
    await initCamera(); // 12. 다시 카메라 실행
    setState(() {}); // 13. 화면에 출력
  }

  Future<void> setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);

    /// FlashMode 설정하기 [주의] await 해야함.
    _flashMode = _cameraController
        .value.flashMode; // 16. controller에서 현재 flashLight 모드에 대한 정보를 가져올 수 있음.
    setState(() {});
  }

  Future<void> _startRecording() async {
    if (_cameraController.value.isRecordingVideo) return;
    log("start recording");
    await _cameraController
        .startVideoRecording(); // .비디오 녹화 시작. + 다른 애니메이션들과 iniState, dispose위치를 대칭으로 해주지 않으면 오류가 생김 이유는 모르겠음.

    _buttonAnimationController.forward(); // 촬영중에 확대
    _progressAnimationController.forward(); // 촬영중에 진행

    _offsetIncrement = const Offset(0, 0);
    log(_offsetIncrement.toString());
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) return;
    log("stop recording");

    _buttonAnimationController.reverse(); // 촬영이 끝나면 축소
    _progressAnimationController.reset(); // 촬영이 끝나면 Indicator 삭제

    final video = await _cameraController.stopVideoRecording(); // .비디오 녹화 종료.

    if (!mounted) return;

    /// 1. mounted 속성 값이 true인 시간은 State 객체가 화면에 마운트된 이후부터 화면에서 제거될 때까지입니다.
    /// 2. 이러한 기간은 위젯의 생명주기에 따라 다르며, 위젯이 다시 빌드될 때마다 mounted 속성 값은 true가 됩니다.
    /// 3. 따라서, mounted 속성 값이 true인 시간은 위젯의 생명주기에 따라 다르지만,
    /// 4. 위젯이 화면에 존재하는 동안은 true이며, 화면에서 제거되면 false가 됩니다.
    /// 5. 그러므로, mounted 속성 값을 사용하여 State 객체가 화면에 마운트된 상태인지 여부를 확인할 수 있습니다.

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => VideoPreviewScreen(
    //       video: video,
    //     ),
    //   ),
    // );
  }

  Future<void> _pickVideoFromGallery() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (!mounted) return;
    if (video == null) return; // 이미지가 안 골라지고 나올 수 있음.
    log(video.toString());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          video: video,
          isPicked: true,
        ),
      ),
    );
  }

  Future<void> _imagePickerCamera() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (!mounted) return;
    if (video == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          video: video,
        ),
      ),
    );
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _offsetIncrement += details.delta;
      if (_offsetIncrement.dy < -10) {
        final dy = _offsetIncrement.dy * (-1);
        final newZoomLevel = dy / 10;
        if (newZoomLevel > _maxZoomLevel) {
          _cameraController.setZoomLevel(_maxZoomLevel);
        } else {
          _cameraController.setZoomLevel(newZoomLevel);
        }
      } else {
        _cameraController.setZoomLevel(_minZoomLevel);
      }
    });
    log(_offsetIncrement.toString());
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
                    top: 30,
                    right: 20,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: toggleSefieMode,
                          icon: const Icon(Icons.cameraswitch),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => setFlashMode(FlashMode.always),
                          icon: const Icon(Icons.flash_on_rounded),
                          color: _flashMode == FlashMode.always
                              ? Colors.amber.shade200
                              : null,
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => setFlashMode(FlashMode.off),
                          icon: const Icon(Icons.flash_off_rounded),
                          color: _flashMode == FlashMode.off
                              ? Colors.amber.shade200
                              : null,
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => setFlashMode(FlashMode.auto),
                          icon: const Icon(Icons.flash_auto_rounded),
                          color: _flashMode == FlashMode.auto
                              ? Colors.amber.shade200
                              : null,
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => setFlashMode(FlashMode.torch),
                          icon: const Icon(Icons.flashlight_on),
                          color: _flashMode == FlashMode.torch
                              ? Colors.amber.shade200
                              : null,
                        ),
                        Gaps.v10,
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const Spacer(flex: 2),
                        ScaleTransition(
                          scale: _buttonAnimation, // 확대 애니메이션
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 70, // 사이즈를 아래 버튼보다 크게해야 보임
                                height: 70,
                                child: CircularProgressIndicator(
                                  color: Colors.red,

                                  value: _progressAnimationController
                                      .value, // [중요] Indicator에 value값에 0.0 ~ 1.0 사이의 값이 들어갈 경우 비율만큼 Indicator가 차지함
                                ),
                              ),
                              GestureDetector(
                                // 설정
                                // * 주의 * 스택의 아래에 위치할 경우 gesture 무시됨
                                onTapDown: (details) => _startRecording(),
                                onTapUp: (details) => _stopRecording(),

                                onVerticalDragUpdate: _onVerticalDragUpdate,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: _pickVideoFromGallery,
                            icon: const Icon(
                              FontAwesomeIcons.image,
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: _imagePickerCamera,
                            icon: const Icon(
                              FontAwesomeIcons.camera,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
