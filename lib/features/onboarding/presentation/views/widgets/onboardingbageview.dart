import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/features/onboarding/presentation/views/widgets/pageview_item.dart';

class Onboarding_pageview extends StatelessWidget {
  const Onboarding_pageview({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageviewItem(
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          backgroundimage: Assets.imagesPageViewItem1BackgroundImage,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "مرحبًا بك في ",
                style: TextStyles.bold23,
              ),
              Text(
                "HUB",
                style: TextStyles.bold23.copyWith(color: AppColors.secondaryColor),
              ),
              Text(
                "Fruit",
                style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
              )
            ],
          ),
          image: Assets.imagesPageViewItem1Image,
          isVisible: true,
        ),
        const PageviewItem(
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          backgroundimage: Assets.imagesPageViewItem2BackgroundImage,
          title: Text(
            "ابحث وتسوق",
            style: TextStyles.bold23,
          ),
          image: Assets.imagesPageViewItem2Image,
          isVisible: false,
        ),
      ],
    );
  }
}
