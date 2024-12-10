import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/notification_widget.dart';
import 'package:go_router/go_router.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    title: const Padding(
      padding: EdgeInsetsDirectional.only(top: 16),
      child: Text(
        'الأكثر مبيعًا',
        style: TextStyles.bold19,
      ),
    ),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsetsDirectional.only(end: 16, top: 16),
        child: NotificationWidget()
      ),
    ],
    leading: Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 16),
      child: GestureDetector(
        onTap: () {
          log('${GoRouter.of(context).canPop()}');
          GoRouter.of(context).pop();
        },
        child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF1F1F5), width: 1),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
    ),
  );
}
