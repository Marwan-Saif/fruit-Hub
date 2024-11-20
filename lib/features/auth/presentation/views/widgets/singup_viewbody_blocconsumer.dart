import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/widgets/custom_snakbar.dart';
import 'package:fruits/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signup_viewbody.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SingUpviewBodyBlocConsumer extends StatelessWidget {
  const SingUpviewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingupCubit, SingupState>(
      listener: (context, state) {
        if (state is SingupSuccess) {
          // Navigator.pushReplacementNamed(context, '/signin');
        } else if (state is Singupfailure) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SingupLoading? true : false, 
            progressIndicator: const CircularProgressIndicator(),
            child: SignupViewBody());
      },
    );
  }


}
