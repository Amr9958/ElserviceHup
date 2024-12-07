import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/get_it_service.dart';


part 'lang_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()) {
    final isEnglish = getIt.get<SharedPreferences>().getBool('isEnglish') ?? true;
    emit(LanguageChanged((isEnglish ? "en" : "ar")));
  }

  void changeLanguages() {
    final isEnglish = !(state is LanguageChanged &&
        (state as LanguageChanged).locale == "en");
    emit(LanguageChanged((isEnglish ? "en" : "ar")));
    getIt.get<SharedPreferences>().setBool('isEnglish', isEnglish);
  }
}
