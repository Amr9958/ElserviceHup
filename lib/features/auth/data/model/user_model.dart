import 'package:firebase_auth/firebase_auth.dart';


import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(super.email, super.name, super.uid);
  factory UserModel.fromFirebase(User user) =>
      UserModel(user.email ?? "", user.displayName ?? "", user.uid);

  @override
  List<Object?> get props => [email, name, uid];
}
