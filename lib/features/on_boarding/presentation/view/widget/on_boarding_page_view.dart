import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(controller: pageController, children: [
      PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
                  0,
          widget: Text.rich(TextSpan(children: [
            TextSpan(
                text: S.of(context).onBoardingOneTitle,
                style: TextStyles.bold23),
            TextSpan(
                text: "Fruit",
                style:
                    TextStyles.bold23.copyWith(color: AppColors.primaryColor)),
            TextSpan(
                text: "Hup",
                style: TextStyles.bold23.copyWith(color: Colors.yellow)),
          ])),
          backGroundImage: AppImages.imagesPageViewItem1BackgroundImage,
          image: AppImages.imagesPageViewItem1Image,
          supTitle: S.of(context).onBoardingSubTitle),
      PageViewItem(
        isVisible: false,
        backGroundImage: AppImages.imagesPageViewItem2BackgroundImage,
        image: AppImages.imagesPageViewItem2Image,
        widget: Text(
          S.of(context).onBoardingOneTitle,
          style: TextStyles.bold23,
        ),
        supTitle: S.of(context).onBoardingTwoSubTitle,
      )
    ]);
  }
}
