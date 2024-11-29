import 'package:bloc/bloc.dart';
import 'package:fruits/features/auth/domain/entites/user_entity.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';

part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit(this.authRepo) : super(SingupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(String email, String password ,String name) async {
    emit(SingupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password,name);
    result.fold((failure) => emit(Singupfailure(message: failure.message)), (userEntity) => emit(SingupSuccess(user: userEntity)));
  }
}
