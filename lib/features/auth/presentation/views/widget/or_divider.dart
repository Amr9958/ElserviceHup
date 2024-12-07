import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/sized_box_extension.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0XFFDCDEDE),
          ),
        ),
        18.wSizedBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            S.of(context).loginDivider,
            style: TextStyles.semiBold16,
          ),
        ),
        18.wSizedBox,
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0XFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
