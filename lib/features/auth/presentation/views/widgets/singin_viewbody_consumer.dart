import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/widgets/custom_progresshub.dart';
import 'package:fruits/core/widgets/custom_snakbar.dart';
import 'package:fruits/features/auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signinview_body.dart';
import 'package:go_router/go_router.dart';

class SinginviewBodyConsumer extends StatelessWidget {
  const SinginviewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SinginCubit, SinginState>(
      listener: (context, state) {
        if (state is SinginSuccessState) {
          customSnackBar(context, state.user.email!);
          log("message");
          GoRouter.of(context).pushReplacement(AppRouter.homeView);  
          // context.go(AppRouter.homeView);  
          log("message2");


          // Navigator.pushReplacementNamed(context, '/home');
        } else if (state is SinginFailureState) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHub(
          isLoading: state is SinginLoadingState,
          child: SigninViewBody(),
        );
      },
    );
  }
}
