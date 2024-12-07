import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../maneger/signup_cubit/signup_cubit.dart';
import 'Check_email_prompt.dart';
import 'password.dart';
import 'terms_and_condition_widget.dart';

class SingUpViewBody extends StatefulWidget {
  const SingUpViewBody({super.key});

  @override
  State<SingUpViewBody> createState() => _SingUpViewBodyState();
}

class _SingUpViewBodyState extends State<SingUpViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
        } else if (state is SignupError) {
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
                CustomTextFormField(
                  controller: nameController,
                  hintText: S.of(context).nameField,
                ),
                CustomTextFormField(
                  controller: emailController,
                  hintText: S.of(context).emailField,
                ),
                Password(passwordController: passwordController),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TermsAndConditionWidget(
                    onCheckboxChanged: (value) => isTermsAccepted = value,
                  ),
                ),
                state is! SignupLoading
                    ? CustomButton(
                        onPressed: () {
                          log("message");
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            isTermsAccepted
                                ? context
                                    .read<SignupCubit>()
                                    .createUserWithEmailAndPassword(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                : customSnackBar(
                                    context,
                                    message:
                                        "You must accept the terms and conditions",
                                  );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        text: S.of(context).sindUPAppBarTitle,
                      )
                    : const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CheckEmailPromptWidget(
                    title: S.of(context).singUpCheckAccount,
                    link: S.of(context).singUpLogin,
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

void customSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
