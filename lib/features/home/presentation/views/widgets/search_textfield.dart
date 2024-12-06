import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x0A000000),
              offset: Offset(0, 2),
              blurRadius: 9 ,
              spreadRadius: 0
            )
        ]
      ),
      child: TextFormField(
          decoration: InputDecoration(
        suffixIcon: const Image(image: Svg((Assets.imagesFilterIcon))),
        prefixIcon: const Image(image: Svg((Assets.imagesSearchIcon))),
        filled: true,
        fillColor: Colors.white,
        border: borderDecoration(),
        enabledBorder: borderDecoration(),
        focusedBorder: borderDecoration(),
        hintText: 'ابحث عن شيء',
        hintStyle: TextStyles.regular13.copyWith(
          color: const Color(0xFF949D9E),
        ),
      )),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.white,
        ));
  }
}
