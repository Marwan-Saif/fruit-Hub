import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class BeastsellingHeader extends StatelessWidget {
  const BeastsellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('${GoRouter.of(context).canPop()}');
        context.push(AppRouter.bestSelling);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'الأكثر مبيعًا',
            style: TextStyles.bold16,
          ),
          Text(
            'المزيد',
            style:
                TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          )
        ],
      ),
    );
  }
}
