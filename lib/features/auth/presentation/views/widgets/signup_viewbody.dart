import 'package:flutter/material.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_textformfield.dart';
import 'package:fruits/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  bool terms = false;
  @override

  /// Returns a column of widgets that form the body of the signup view.
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          const SizedBox(height: 24),
          const CustomTextFormField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'كلمة المرور',
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            suffixIcon: Icon(Icons.visibility, color: Color(0xFFC9CECF)),
          ),
          const SizedBox(height: 16),
          TermsAndConditions(
            isChecked: (value) {
              terms = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
          const SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لديك حساب بالفعل؟',
                style: TextStyles.regular13
                    .copyWith(color: const Color(0xFF949D9E)),
              ),
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'تسجيل دخول',
                    style: TextStyles.semiBold13,
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
