import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const String routeName = '/edit-profile';
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الصفحة الشخصية",
          style: TextStyles.bold19,
        ),
        centerTitle: true,
      ),
      body: const EditProfileBody(),
    );
  }
}

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "المعلومات الشخصية",
          style: TextStyle(fontSize: 20),
        ),
        CustomTextFormField(hintText: '', textInputType: TextInputType.text),
        Text(
          "المعلومات الشخصية",
          style: TextStyle(fontSize: 20),
        ),
        CustomTextFormField(hintText: '', textInputType: TextInputType.text),
        Text(
          "المعلومات الشخصية",
          style: TextStyle(fontSize: 20),
        ),
        CustomTextFormField(hintText: '', textInputType: TextInputType.text),
        Text(
          "المعلومات الشخصية",
          style: TextStyle(fontSize: 20),
        ),
        CustomTextFormField(hintText: '', textInputType: TextInputType.text),
      ],
    );
  }
}
