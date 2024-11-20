import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.email,
    required super.name,
  });
  factory UserModel.fromFirebase(User user,String name) {
    return UserModel(uid: user.uid, email: user.email, name: name);
  }
}
