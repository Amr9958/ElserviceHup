import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/domain/entites/car_item_entity.dart';

part 'profileData_state.dart';

class profileDataCubit extends Cubit<profileDataState> {
  profileDataCubit() : super(profileDataInitial());

  void updateprofileData(profileDataEntity carItem) {
    
    emit(profileDataUpdated(carItem));
  }
}
