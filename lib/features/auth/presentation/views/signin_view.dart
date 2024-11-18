import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/build_appbar.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signinview_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
      body: const SigninViewBody(),
    );
  }


}
