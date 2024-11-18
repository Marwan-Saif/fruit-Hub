import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_textformfield.dart';
import 'package:fruits/core/widgets/social_media_tap.dart';
import 'package:go_router/go_router.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomTextFormField(
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'كلمة المرور',
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: Icon(
              Icons.visibility,
              color: Color(0xFFC9CECF),
            ),
          ),
          const SizedBox(height: 16),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor),
              )),
          const SizedBox(height: 37),
          CustomButton(
            text: 'تسجيل الدخول',
            onPressed: () {},
          ),
          const SizedBox(height: 33),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: 'ليس لديك حساب؟ ',
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xFF616A6B)),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.push(AppRouter.signupView);},
              text: ' قم بإنشاء حساب',
              style:
                  TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
            ),
          ])),
          const SizedBox(height: 37),
          orDividor(),
          const SizedBox(height: 32),
          const SocialMediaLoginButton(
            title: 'تسجيل الدخول باستخدام Google',
            imagePath: Assets.imagesGoogleIcon,
          ),
          const SizedBox(height: 16),
          const SocialMediaLoginButton(
            title: 'تسجيل الدخول باستخدام Apple',
            imagePath: Assets.imagesApple,
          ),
          const SizedBox(height: 16),
          const SocialMediaLoginButton(
            title: 'تسجيل الدخول باستخدام Facebook',
            imagePath: Assets.imagesFacebookIcon,
          ),
        ],
      ),
    ));
  }

  Row orDividor() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 18.0),
          child: Text(
            'او',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
