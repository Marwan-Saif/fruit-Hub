import 'package:bloc/bloc.dart';
import 'package:fruits/features/auth/domain/entites/user_entity.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'singin_state.dart';

class SinginCubit extends Cubit<SinginState> {
  SinginCubit(this.authRepo) : super(SinginInitialState());
  final AuthRepo authRepo;
  void signInWithEmailAndPassword(String email, String password) async {
    emit(SinginLoadingState());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((failure) => emit(SinginFailureState(message: failure.message)),
        (userEntity) => emit(SinginSuccessState(user: userEntity)));
  }
}
