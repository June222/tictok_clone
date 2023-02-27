import 'package:go_router/go_router.dart';
import 'package:tictok_clone/features/authentication/username_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/login_form_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/login_screen.dart';
import 'package:tictok_clone/features/authentication/widgets/sign_up_screen.dart';
import 'package:tictok_clone/features/navigation/main_navigation_screen.dart';
import 'package:tictok_clone/features/onboarding/interests_screen.dart';
import 'package:tictok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tictok_clone/features/vidoes/video_recording_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const VideoRecordingScreen(),
    )
    // GoRoute(
    //   path: SignUpScreen.routeURL,
    //   builder: (context, state) => const SignUpScreen(),
    //   routes: [
    //     GoRoute(
    //       path: UserNameScreen.routeURL,
    //       builder: (context, state) => const UserNameScreen(),
    //       // pageBuilder: (context, state) {
    //       //   return CustomTransitionPage(
    //       //     child: const UserNameScreen(),
    //       //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //       //         FadeTransition(
    //       //       opacity: animation,
    //       //       child: child,
    //       //     ),
    //       //   );
    //       // },
    //       routes: [
    //         GoRoute(
    //           path: EmailScreen.routeURL,
    //           builder: (context, state) {
    //             final args = state.extra as EmailScreenArgs;
    //             final username = args.username;
    //             return EmailScreen(username: username);
    //           },
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       // name: LoginScreen.routeName,
    //       path: LoginScreen.routeURL,
    //       builder: (context, state) => const LoginScreen(),
    //       routes: [
    //         GoRoute(
    //           path: LoginFormScreen.routeURL,
    //           builder: (context, state) => const LoginFormScreen(),
    //           routes: [
    //             GoRoute(
    //               path: InterestsScreen.routeURL,
    //               builder: (context, state) => const InterestsScreen(),
    //               routes: [
    //                 GoRoute(
    //                   path: TutorialScreen.routeURL,
    //                   builder: (context, state) => const TutorialScreen(),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // // GoRoute(
    // //   path: '/users/:username', //:다음에는 parameter의 이름을 정하는 것
    // //   builder: (context, state) {
    // //     // print(state.params);
    // //     final username =
    // //         state.params['username']; // 주소창에 입력한 parameter의 값을 불러와서 사용할 수 있음.
    // //     // 주소창에 .../?show=###에서 ###에 적힌 값을 받아옴.
    // //     // 받아온 값으로 특정 tab을 열게함.
    // //     final tab = state.queryParams['show'];
    // //     return UserProfileScreen(
    // //       username: username!,
    // //       tab: tab!,
    // //     );
    // //   },
    // // )
    // GoRoute(
    //   path: MainNavigationScreen.routeURL,
    //   builder: (context, state) => const MainNavigationScreen(),
    // ),
  ],
);
