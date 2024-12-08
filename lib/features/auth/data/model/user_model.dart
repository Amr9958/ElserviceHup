// import 'package:firebase_auth/firebase_auth.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(super.email, super.name, super.uid);
  // factory UserModel.fromFirebase(User user) =>
  //     UserModel(user.email ?? "", user.displayName ?? "", user.uid);
  factory UserModel.fromSupabase(User user) {
    return UserModel(
      user.email ?? "",
      user.userMetadata?['name'] ?? "",
      user.id,
    );
  }

  @override
  List<Object?> get props => [email, name, uid];
}
