import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFF3F5F7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_rounded))),
                  Column(
            children: [
              
            
          const Flexible(
              child: Image(
            image: Svg((Assets.imagesPageViewItem2Image)),
            // fit: BoxFit.fill,
          )),
          const SizedBox(height: 10,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'اسم الفاكه',
                    style: TextStyles.semiBold13,
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: '30 جنيه ',
                        style: TextStyles.bold13
                            .copyWith(color: const Color(0xFFF4A91F)),
                      ),
                      TextSpan(
                        text: '/ لكيلو',
                        style: TextStyles.semiBold13
                            .copyWith(color: const Color(0xFFF4A91F)),
                      ),
                    ]),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: Color(0xFF1B5E37),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ]),]),
      ),
    );
  }
}
