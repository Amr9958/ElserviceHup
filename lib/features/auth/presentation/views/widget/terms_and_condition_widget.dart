import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key, required this.onCheckboxChanged});
final ValueChanged<bool> onCheckboxChanged;
  @override
  State<TermsAndConditionWidget> createState() =>
      _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
                widget.onCheckboxChanged(isSelected);
              });
            }),
        Expanded(
          child: Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "من خلال انشاء حساب ، فإنك توافق على ",
                style: TextStyles.regular16
                    .copyWith(color: const Color(0XFF949D9E)),
              ),
              TextSpan(
                text: "الشروط والاحكام الخاصه بناء",
                style: TextStyles.regular16
                    .copyWith(color: AppColors.lightPrimaryColor),
              )
            ],
          )),
        )
      ],
    );
  }
}
