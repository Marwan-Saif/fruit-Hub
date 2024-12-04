import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    // return SliverToBoxAdapter(child: Container());
    return ListTile(
        trailing: const CircleAvatar(
          backgroundColor: Color(0xFFEEF8ED),
          child: Image(
            image: Svg((Assets.imagesNotificationicon)),
          ),
        ),
        leading: Image.asset(Assets.imagesProfileImage),
        title: Text(
          'صباح الخير !..',
          style: TextStyles.regular16.copyWith(
            color: const Color(0xFF909E9D),
          ),
        ),
        subtitle: Text(
          'أحمد مصطفي',
          style: TextStyles.semiBold16.copyWith(
            color: const Color(0xFF0C0D0D),
          ),
        ));
  }
}
