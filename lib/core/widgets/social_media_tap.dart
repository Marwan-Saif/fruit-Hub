import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class SocialMediaLoginButton extends StatelessWidget {
  const SocialMediaLoginButton({
    super.key, required this.title, required this.imagePath,
  });
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0XFFE6E9EA), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: Svg((imagePath)),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(title,
              style: TextStyles.semiBold16.copyWith(color: const Color(0xFF0C0D0D)))
        ],
      ),
    );
  }
}
