import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/constant/sized_box_extension.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../maneger/login_cubit/login_cubit.dart';
import 'check_email_prompt.dart';
import 'or_divider.dart';
import 'password.dart';
import 'singup_view_body.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
        } else if (state is LoginError) {
          customSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                40.hSizedBox,
                CustomTextFormField(
                  controller: emailController,
                  hintText: S.of(context).emailField,
                ),
                15.hSizedBox,
                Password(passwordController: passwordController),
                15.hSizedBox,
                Row(
                  mainAxisAlignment: isArabic()
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).pushNamed('ForgetPasswordView');
                        },
                        child: Text(
                          S.of(context).loginForgotPassword,
                          style: TextStyles.regular16
                              .copyWith(color: AppColors.lightPrimaryColor),
                        )),
                  ],
                ),
                20.hSizedBox,
                CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<LoginCubit>().loginWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                    text: S.of(context).loginAppBarTitle),
                15.hSizedBox,
                CheckEmailPromptWidget(
                  onTap: () => Navigator.of(context).pushNamed('/singUp'),
                  title: S.of(context).loginDontHaveAccount,
                  link: S.of(context).loginRegisterNow,
                ),
                40.hSizedBox,
                const OrDivider(),
                10.hSizedBox,
                SocialLoginButton(
                  image: AppImages.imagesGoogleIcon,
                  onPress: () {
                    context.read<LoginCubit>().loginWithGoogle();
                    // context.read<ThemeCubit>().changeTheme();
                    // context.read<LanguageCubit>().changeLanguages();
                  },
                  title: S.of(context).loginWithGoogle,
                ),
                SocialLoginButton(
                  image: AppImages.imagesApplIcon,
                  onPress: () {},
                  title: S.of(context).LoginWithApple,
                ),
                SocialLoginButton(
                  image: AppImages.imagesFacebookIcon,
                  onPress: () {
                    context.read<LoginCubit>().loginWithFacebook();
                  },
                  title: S.of(context).loginWithFacebook,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
