import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({
    this.termsAndConditions,
    super.key,
    required this.isChecked,
  });
  bool? termsAndConditions ;
  final ValueChanged<bool> isChecked;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(12, 0),
      child: Row(children: [
        Checkbox(
          value: widget.termsAndConditions??false,
          onChanged: (value) {
            widget.termsAndConditions = value;
            widget.isChecked(value!);
            setState(() {});
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        Expanded(
          child: Text.rich(
            maxLines: 2,
            TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على ',
              style: TextStyles.semiBold13.copyWith(
                color: Color(0xFF616A6B),
              ),
              children: [
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
