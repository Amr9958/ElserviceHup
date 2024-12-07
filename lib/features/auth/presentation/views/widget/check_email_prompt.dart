import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CheckEmailPromptWidget extends StatelessWidget {
  const CheckEmailPromptWidget({
    super.key,
    required this.title,
    required this.link,
    required this.onTap,
  });
  final String title, link;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style:
                TextStyles.regular16.copyWith(color: const Color(0XFF949D9E)),
          ),
          const TextSpan(
            text: " ",
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                link,
                style: TextStyles.regular16
                    .copyWith(color: AppColors.lightPrimaryColor),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center, // Align the text
    );
  }
}
