
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/review_entity.dart';

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
  ProfileDataEntity(
      {
        required this.id, 
     });

  @override
  List<Object?> get props => [code];
}
