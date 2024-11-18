
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: Svg((Assets.imagesPlant))),
            Center(child: Image(image: Svg((Assets.imagesLogo)))),
            Image(image: Svg((Assets.imagesSplashBottom)))
          ],
        ),
      ),
    );
  }
}
