import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/notification_widget.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    // return SliverToBoxAdapter(child: Container());
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
        trailing: const NotificationWidget(),
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