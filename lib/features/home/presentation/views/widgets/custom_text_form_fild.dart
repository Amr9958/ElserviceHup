import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.onTap,
    this.keyboardType,
    this.icon,
    this.validator,
    this.maxLines,
    this.readOnly = false,
    this.labelText,
    this.enabled,
    this.expands = false,
  });

  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final String? hintText, labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool readOnly;
  final bool? enabled;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (data) {
            if (data!.isEmpty) {
              return 'يجب ملء هذا الحقل';
            }
            return null;
          },
      enabled: enabled,
      keyboardType: keyboardType,
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: obscureText,
      // maxLines: obscureText==true?null:maxLines,
      // expands: expands,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blue)),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.orange)),
      ),
    );
  }
}
