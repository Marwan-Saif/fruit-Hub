import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
  );
}
