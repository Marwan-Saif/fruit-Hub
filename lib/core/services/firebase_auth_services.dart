import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthServices.createUserWithEmailAndPassword: $e');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري قصيراً.');
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
        // print('The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'ddddddلقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthServices.createUserWithEmailAndPassword: $e code is ');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
