import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/firebase_options.dart';

import 'core/services/bloc_observer.dart';
import 'core/helper_functions/app_route.dart';
import 'core/styles/app_theme.dart';
import 'core/styles/cubit/theme_cubit.dart';
import 'core/styles/lang/lang_cubit.dart';
import 'core/services/service_locator.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
Bloc.observer = MyBlocObserver();
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

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
                  initialRoute: SplashView.splashRoute,
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
