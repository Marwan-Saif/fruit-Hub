import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/build_appbar.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signup_viewbody.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'تسجيل جديد',
      ),
      body: SignupViewBody(),
    );
  }
}