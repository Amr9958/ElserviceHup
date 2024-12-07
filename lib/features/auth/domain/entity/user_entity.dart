import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String name;
  final String uid;
  const UserEntity(this.email, this.name, this.uid);

  @override
  List<Object?> get props => [email, name, uid];
}
