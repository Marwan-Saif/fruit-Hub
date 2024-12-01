import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/errors/exceptions.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/database_service.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/core/utils/backend_endpoints.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entites/user_entity.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImpl(this.firebaseAuthServices, this.databaseService);
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel.fromFirebase(user, name);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);

      return left(ServerFailures(e.message));
    } catch (e) {
      await deleteUser(user);

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
      var userEntity = await getUserData(userId: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailures(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: $e');
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebase(user, '');
      var isUserExist = await databaseService.ifDataExist(
          path: BackendEndpoints.addUserData, documentId: user.uid);
      if (!isUserExist) {
        await addUserData(user: userEntity);
      } 

      return Right(UserModel.fromFirebase(user, ''));
    } catch (e) {
      deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFirebase(user, '');
      await addUserData(user: userEntity);
      return Right(UserModel.fromFirebase(user, ''));
    } catch (e) {
      deleteUser(user);
      log(
        'Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}',
      );
      return left(ServerFailures('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    // throw CustomException(message: 'there was an error in something');
    await databaseService.addData(
        documentId: user.uid,
        path: BackendEndpoints.addUserData,
        data: user.toMap());
  }

  @override
  Future deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    final user = await databaseService.getData(
        path: BackendEndpoints.addUserData, documentId: userId);
    return UserModel.fromJson(user);
  }
}
