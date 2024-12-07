import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constant/cached.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../on_boarding/presentation/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _navigateToNextView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment:
                isArabic() ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppImages.imagesPlant),
            ],
          ),
          Center(
            child: SvgPicture.asset(AppImages.imagesLogo),
          ),
          SvgPicture.asset(
            AppImages.imagesSplashBottom,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  void _navigateToNextView() async {
    final isOnBoardingDone =
        sl.get<SharedPreferences>().getBool(Cached.kOnBoardingViewDone) ??
            false;

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final route = isOnBoardingDone
        ? LoginView.routeName
        : OnBoardingView.onBoardingViewRoute;

    Navigator.pushReplacementNamed(context, route);
  }
}
