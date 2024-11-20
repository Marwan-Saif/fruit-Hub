import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/getit_service.dart';
import 'package:fruits/core/widgets/build_appbar.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signup_viewbody.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingupCubit(getit.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: 'تسجيل جديد',
        ),
        body: SignupViewBody(),
      ),
    );
  }
}
