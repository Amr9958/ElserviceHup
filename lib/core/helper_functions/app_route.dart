import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/change_password_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/otv_view.dart';
import '../../features/auth/presentation/views/singup_view.dart';
import '../../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.splashRoute:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.onBoardingViewRoute:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SingUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SingUpView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    case ChangePasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ChangePasswordView());
    case OtvView.routeName:
      return MaterialPageRoute(builder: (_) => const OtvView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}

