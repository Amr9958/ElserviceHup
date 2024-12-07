import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar customAppBar(
  context, {
  required String title,
}) {
  return AppBar(
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
    leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios_new)),
  );
}
