import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/sized_box_extension.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widget/custom_abb_bar.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';
import 'otv_view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = "ForgetPasswordView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: S.of(context).forgetPasswordAppBarTitle),
      body: const ForgetPasswordViewBody(),
    );
  }
}

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
      child: Column(children: [
        Text(S.of(context).ForgotPasswordTitle,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0XFF949D9E),
            )),
        30.hSizedBox,
        CustomTextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
        ),
        30.hSizedBox,
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context,OtvView.routeName); 
          }
          ,
          text: S.of(context).forgetPasswordButton,
        ),
      ]),
    );
  }
}
