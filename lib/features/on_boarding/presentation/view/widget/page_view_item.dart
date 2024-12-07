import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/media_query_extension.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/constant/cached.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backGroundImage,
    required this.supTitle,
    required this.widget,
    required this.isVisible,
  });
  final String image, backGroundImage, supTitle;
  final Widget widget;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.width,
          height: context.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backGroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                      onTap: () {
                        // context.read<ThemeCubit>().changeTheme();
                        // context.read<LanguageCubit>().changeLanguages();
                        Navigator.of(context)
                            .popAndPushNamed(LoginView.routeName);
                        sl
                            .get<SharedPreferences>()
                            .setBool(Cached.kOnBoardingViewDone, true);
                      },
                      child: Text(S.of(context).onBoardingSkip,
                          style: TextStyles.bold13
                              .copyWith(color: const Color(0XFF4E5556)))),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: context.height * 0.05),
        widget,
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            supTitle,
            textAlign: TextAlign.center,
            style: TextStyles.bold13.copyWith(color: const Color(0XFF4E5556)),
          ),
        ),
      ],
    );
  }
}
