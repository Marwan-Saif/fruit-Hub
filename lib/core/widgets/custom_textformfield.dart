import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText, required this.keyboardType,  this.suffixIcon,  this.isPassword,
  });
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool? isPassword ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        obscureText: isPassword??false,
        
        
        decoration: InputDecoration(
          
          suffixIcon: suffixIcon, 
          filled: true,
          fillColor: const Color(0XFFE6E9EA),
          border: borderDecoration(), 
          enabledBorder: borderDecoration(),
          focusedBorder: borderDecoration(),
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        ));
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Color(0XFFE6E9EA),
        ));
  }
}
