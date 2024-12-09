import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/services/prefs.dart';
import 'package:fruits/features/splash/presentation/views/widgets/splashview_body.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (Prefs.getData(key: kIsOnBoardingViewSeen) == true) {
        print(
            "ابقي عدل النفجيشن للهوم لما تحط الشيرد بريفرنس بتاع تسجيل الدخول ");

        GoRouter.of(context).pushReplacement(AppRouter.homeView);
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.onBoarding);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashViewBody();
  }
}
