import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/exceptions.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entites/user_entity.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl(this.firebaseAuthServices);
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebase(user, name));
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebase(user, ''));
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: $e');
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override 
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthServices.signInWithGoogle();
      return Right(UserModel.fromFirebase(user, ''));
    }
     
    catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthServices.signInWithFacebook();
      return Right(UserModel.fromFirebase(user, ''));
    }
     
    catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}',
      );
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
}
