part of 'profileData_cubit.dart';

sealed class ProfileDataState {
  const ProfileDataState();
}

final class ProfileDataInitial extends ProfileDataState {}

final class ProfileDataUpdatedSuccsess extends ProfileDataState {
  final ProfileDataEntity profileDataEntity;

  const ProfileDataUpdatedSuccsess(this.profileDataEntity);
}
final class ProfileDataUpdatedFailure extends ProfileDataState {
  final String mess;

  const ProfileDataUpdatedFailure(this.mess);
}
