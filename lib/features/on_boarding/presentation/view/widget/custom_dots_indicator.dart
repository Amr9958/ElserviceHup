import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';


class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 6,
      backgroundColor:
          isActive ? AppColors.primaryColor : AppColors.lightPrimaryColor,
    );
  }
}
