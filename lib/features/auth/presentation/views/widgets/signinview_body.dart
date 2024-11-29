import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_images.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_textformfield.dart';
import 'package:fruits/core/widgets/password_field.dart';
import 'package:fruits/core/widgets/social_media_tap.dart';
import 'package:fruits/features/auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:go_router/go_router.dart';

class SigninViewBody extends StatefulWidget {
  SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              onSaved: (p0) => email = p0!,
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            PasswordField(
              onSaved: (p0) => password = p0!,
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // log('email  password $password');
                  context
                      .read<SinginCubit>()
                      .signInWithEmailAndPassword(email, password);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
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
                    context.push(AppRouter.signupView);
                  },
                text: ' قم بإنشاء حساب',
                style: TextStyles.semiBold16
                    .copyWith(color: AppColors.primaryColor),
              ),
            ])),
            const SizedBox(height: 37),
            orDividor(),
            const SizedBox(height: 32),
             SocialMediaLoginButton(
              onTap: () {
                context
                      .read<SinginCubit>()
                      .signInWithGoogle();
                // context.<singinCubit>read().sing
              },
              title: 'تسجيل الدخول باستخدام Google',
              imagePath: Assets.imagesGoogleIcon,
            ),
            const SizedBox(height: 16),
            const SocialMediaLoginButton(
              title: 'تسجيل الدخول باستخدام Apple',
              imagePath: Assets.imagesApple,
            ),
            const SizedBox(height: 16),
             SocialMediaLoginButton(
              title: 'تسجيل الدخول باستخدام Facebook',
              imagePath: Assets.imagesFacebookIcon,
              onTap:(){
                context.read<SinginCubit>().signInWithFacebook();
              }
            ),
          ],
        ),
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
