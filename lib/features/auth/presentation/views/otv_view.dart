import 'package:flutter/material.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/widget/custom_abb_bar.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';

class OtvView extends StatelessWidget {
  const OtvView({super.key});
  static const routeName = '/OtvView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: S.of(context).forgetPasswordAppBarTitle),
      body: const OtvViewBody(),
    );
  }
}

class OtvViewBody extends StatefulWidget {
  const OtvViewBody({super.key});

  @override
  State<OtvViewBody> createState() => _OtvViewBodyState();
}

class _OtvViewBodyState extends State<OtvViewBody> {
  final formKey = GlobalKey<FormState>();
  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();
  @override
  void dispose() {
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CustomTextFormField(
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: otp1Controller,
            )),
            Expanded(
                child: CustomTextFormField(
              maxLength: 1,
              textAlign: TextAlign.center,
              controller: otp2Controller,
              keyboardType: TextInputType.number,
            )),
            Expanded(
                child: CustomTextFormField(
              maxLength: 1,
              textAlign: TextAlign.center,
              controller: otp3Controller,
              keyboardType: TextInputType.number,
            )),
            Expanded(
                child: CustomTextFormField(
              textAlign: TextAlign.center,
              maxLength: 1,
              controller: otp4Controller,
              keyboardType: TextInputType.number,
            )),
          ],
        ),
        CustomButton(onPressed: () {}, text: "")
      ]),
    );
  }
}
