import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_snakbar.dart';
import 'package:fruits/core/widgets/custom_textformfield.dart';
import 'package:fruits/core/widgets/password_field.dart';
import 'package:fruits/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  bool terms = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, name, password;
  @override

  /// Returns a column of widgets that form the body of the signup view.
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              onSaved: (value) => name = value!,
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) => email = value!,
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            PasswordField(
              onSaved: (value) => password = value!,
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
            CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (terms == true) {
                      formKey.currentState!.save();
                      context
                          .read<SingupCubit>()
                          .createUserWithEmailAndPassword(
                              email, password, name);
                      // if (terms) {
                      //   context.pushReplacementNamed(AppRouter.signinView);
                      // }
                    } else {
                      customSnackBar(
                          context, " يجب الموافقه علي الشروط والاحكام ");
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                text: 'إنشاء حساب جديد'),
            const SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لديك حساب بالفعل؟',
                  style: TextStyles.semiBold13
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
      ),
    );
  }
}
