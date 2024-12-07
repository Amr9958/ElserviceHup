import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widget/custom_abb_bar.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../generated/l10n.dart';
import 'widget/password.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = "ChangePasswordView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: S.of(context).changePasswordAppBarTitle),
      body: const ChangePasswordViewBody(),
    );
  }
}

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(S.of(context).changePasswordTitle, style: TextStyles.semiBold16),
          Password(passwordController: passwordController),
          Password(passwordController: confirmPasswordController),
          CustomButton(onPressed: () {}, text: "text")
        ],
      ),
    );
  }
}
