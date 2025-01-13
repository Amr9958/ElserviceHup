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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          " المعلومات الشخصية",
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomTextFormField(
              hintText: 'الاسم', textInputType: TextInputType.text),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomTextFormField(
              hintText: 'الايميل', textInputType: TextInputType.text),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomTextFormField(
              hintText: 'رقم التليفون', textInputType: TextInputType.number),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomTextFormField(
              hintText: 'العنوان', textInputType: TextInputType.text),
        ),
      ],
    );
  }
}
