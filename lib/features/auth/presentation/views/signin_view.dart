import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/getit_service.dart';
import 'package:fruits/core/widgets/build_appbar.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/manager/singin_cubit/singin_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/singin_viewbody_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SinginCubit(getit.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
        body: const SinginViewBodyConsumer(),
      ),
    );
  }
}

class SinginViewBodyConsumer extends StatelessWidget {
  const SinginViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SinginviewBodyConsumer();
  }
}



