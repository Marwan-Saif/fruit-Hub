part of 'singin_cubit.dart';

abstract class SinginState {}

final class SinginInitialState extends SinginState {}

final class SinginLoadingState extends SinginState {}

final class SinginSuccessState extends SinginState {
  final UserEntity user;
  SinginSuccessState({required this.user});
}

final class SinginFailureState extends SinginState {
  final String message;
  SinginFailureState({required this.message});
}
