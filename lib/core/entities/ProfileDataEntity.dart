
import 'package:equatable/equatable.dart';
class ProfileDataEntity extends Equatable {
  final int id;
  final String username;
  final String email;
  final String? password_hash;
  final String? fcm_token;
  final String? location;
  final String? jop;
  final String? village;
  final List<String>? addresses;
  final List<String>? phone_numbers;
  const ProfileDataEntity(
      {
        required this.id,
        required this.username,
        required this.email,
        this.password_hash,
        this.fcm_token,
        this.location,
        this.jop,
        this.village,
        this.addresses,
        this.phone_numbers,
        
        });

  @override
  List<Object?> get props => [id, username, email, password_hash, fcm_token, location, jop, village, addresses, phone_numbers];
}
