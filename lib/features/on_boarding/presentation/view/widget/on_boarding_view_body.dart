import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../../core/constant/cached.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';
import 'custom_dots_indicator.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomDotsIndicator(
                isActive: true,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomDotsIndicator(
                isActive: currentPage == 1 ? true : false,
              ),
            ],
          ),
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(LoginView.routeName);
                sl
                    .get<SharedPreferences>()
                    .setBool(Cached.kOnBoardingViewDone, true);
              },
              text: "Next",
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
