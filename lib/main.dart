import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';


import 'core/services/custom_bloc_observer.dart';
import 'core/styles/app_theme.dart';
import 'core/styles/cubit/theme_cubit.dart';
import 'core/styles/lang/lang_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();

  setupGetit();
  runApp(const ServiceHup());
}

class ServiceHup extends StatelessWidget {
  const ServiceHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, languageState) {
              if (themeState is ThemeChanged &&
                  languageState is LanguageChanged) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: languageState.locale == "en"
                      ? const Locale("en")
                      : const Locale("ar"),
                  theme: appThemeData[themeState.appTheme]!,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  onGenerateRoute: onGenerateRoute,
                  initialRoute: SplashView.routeName,
                );
              } else {
                return const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
