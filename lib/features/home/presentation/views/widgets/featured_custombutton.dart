import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class FeaturedCustombutton extends StatelessWidget {
  FeaturedCustombutton({super.key, required this.onPressed});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          4,
        ),
        color: Colors.white,
      ),
      height: 32,
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 28,
            vertical: 0,
          ),
          child: FittedBox(
            child: Text(
              "تسوق الان",
              style: TextStyles.bold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
