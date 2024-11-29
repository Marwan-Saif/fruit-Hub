part of 'singup_cubit.dart';


abstract class SingupState {}

final class SingupInitial extends SingupState {}

final class SingupLoading extends SingupState {}

final class SingupSuccess extends SingupState {
  final UserEntity user;
  SingupSuccess({ required this.user});
}

final class Singupfailure extends SingupState {
  final String message;
  Singupfailure({ required this.message});
}
