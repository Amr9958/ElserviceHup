import 'package:flutter/material.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class Password extends StatefulWidget {
  const Password({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        hintText: S.of(context).passwordField,
        maxLines: 1,
        controller: widget.passwordController,
        obscureText: showPassword,
        validator: (value) {
          //  Validator.validatePassword(value);
          if (value == null || value.isEmpty) {
            return 'برجاء ادخال كلمة المرور';
          } else if (value.length < 8) {
            return 'كلمة المرور يجب الا تقل عن 8 حروف';
          }
          return null;
        },
        icon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
              showPassword ? Icons.visibility_off_outlined : Icons.visibility),
        ));
  }
}
