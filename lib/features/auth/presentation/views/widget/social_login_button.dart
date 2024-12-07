import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPress});
  final String image, title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onPress,
          child: ListTile(
            leading: SvgPicture.asset(image),
            title: Text(
              title,
              style: TextStyles.semiBold16,
            ),
          ),
        ),
      ),
    );
  }
}
