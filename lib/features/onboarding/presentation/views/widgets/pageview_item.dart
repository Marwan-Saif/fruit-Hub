import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/constants.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/services/prefs.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class PageviewItem extends StatelessWidget {
  const PageviewItem({
    super.key,
    required this.subTitle,
    required this.backgroundimage,
    required this.title,
    required this.image, required this.isVisible,
  });
  final String subTitle, backgroundimage, image;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image(image: Svg(backgroundimage), fit: BoxFit.fill)),
              Positioned(bottom: 0, right: 50, child: Image(image: Svg(image))),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.signinView);  

                    Prefs.saveData(key:  kIsOnBoardingViewSeen,value:  true);

                    // Navigator.of(context).pushReplacementNamed(
                    //   SigninView.routeName,
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
            
          
        
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.regular13,
          ),
        )
      ],
    );
  }
}
