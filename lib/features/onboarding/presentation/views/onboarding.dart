import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/services/prefs.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/onboarding/presentation/views/widgets/onboardingbageview.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:go_router/go_router.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController pageController;
  var currentpage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () {
        setState(() {
          currentpage = pageController.page!.round();
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
              child: Onboarding_pageview(
            pageController: pageController,
          )),
          DotsIndicator(
            dotsCount: 2,
            position: currentpage,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withOpacity(.5),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Visibility(
            visible: currentpage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizintalPadding,
              ),
              child: CustomButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.signinView);
                  Prefs.saveData(key: kIsOnBoardingViewSeen, value: true);

                  // Prefs.setBool(kIsOnBoardingViewSeen, true);
                  // Navigator.of(context).pushReplacementNamed(
                  //   SigninView.routeName,
                  // );
                },
                text: 'ابدأ الان',
              ),
            ),
          ),
          const SizedBox(
            height: 43,
          ),
        ],
      )),
    );
  }
}
