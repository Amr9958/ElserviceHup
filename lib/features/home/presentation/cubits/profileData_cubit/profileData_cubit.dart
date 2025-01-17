import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/ProfileDataEntity.dart';

part 'profileData_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataInitial());

  void updateprofileData(ProfileDataEntity profileData) {
    
    emit(ProfileDataUpdatedSuccsess(profileData));
  }
}
