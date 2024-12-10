import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/core/widgets/fruit_item.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              alignment: AlignmentDirectional.centerStart,
              // color: Colors.blue,
              height: 20,
            child: const Text(
              'الأكثر مبيعًا',
              style: TextStyles.bold16,),
            ),
            const SizedBox(height: 15),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 16,
                  childAspectRatio: 163 / 214),
              itemBuilder: (context, index) {
                return const FruitItem();
              },
            ))
          ],
        ),
      ),
    );
  }
}
