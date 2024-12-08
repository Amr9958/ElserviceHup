import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
   await Supabase.initialize(
    url: 'https://mfictrvhmblyljrsajqi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1maWN0cnZobWJseWxqcnNhanFpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM1ODEzNTAsImV4cCI6MjA0OTE1NzM1MH0.eVpebCQX5d0Kf5UFbOXN_x0xBVUSakPpwxVr_kaSxOQ',
  );
  await setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  Bloc.observer = MyBlocObserver();
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
