import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/auth/presentation/views/signup_view.dart';
import 'package:fruits/features/onboarding/presentation/views/onboarding.dart';
import 'package:fruits/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoarding = '/onboarding';
  static const signinView = '/signin';
  static const signupView = '/signup';
  // static final splashScreen = '/splash';
  static final roter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onBoarding,
      builder: (context, state) => const OnBoarding(),
    ),
    GoRoute(
      path: signinView,
      builder: (context, state) => const SigninView(),
    ),
    GoRoute(
      path: signupView,
      builder: (context, state) => const SignupView(),
    ),
    // GoRoute(
    //     path: kBookDetailsView,
    //     builder: (context, state) => BlocProvider(
    //       create: (context) =>
    //           RelatedBooksCubit(homeRepo: getit.get<HomeRepoImpl>()),
    //       child: BookDetailsView(
    //         book: state.extra as Item,
    //       ),
    //     ),
    //   ),
  ]);
}
