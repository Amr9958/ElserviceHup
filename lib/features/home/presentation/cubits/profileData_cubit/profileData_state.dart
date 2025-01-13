part of 'profileData_cubit.dart';

sealed class profileDataState {
  const profileDataState();
}

final class profileDataInitial extends profileDataState {}

final class profileDataUpdatedSuccsess extends profileDataState {
  final profileDataEntity profileDataEntity;

  const profileDataUpdatedSuccsess(this.profileDataEntity);
}
final class profileDataUpdatedFailure extends profileDataState {
  final String mess;

  const profileDataUpdatedFailure(this.mess);
}
