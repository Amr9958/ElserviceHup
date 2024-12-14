import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("الصفحة الشخصية",style: TextStyles.bold19,),
        centerTitle: true,

      ),
      body: const SafeArea(child: ProfileViewBody()),
    );
  }
}

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: ProfileEditImage(
              onTap: () {},
            ),
            title: const Text(
              "getUser().name,",
              textAlign: TextAlign.right,
              style: TextStyles.bold16,
            ),
            subtitle: Text(
              "getUser().email,",
              textAlign: TextAlign.right,
              style: TextStyles.regular16.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("data", style: TextStyles.semiBold16),
          ),
          const ProfileLisTileWidget(
            title: "الملف الشخصي",
            image: Assets.imagesVuesaxOutlineHome,
          ),
          const ProfileLisTileWidget(
            title: "طلباتي",
            image: Assets.imagesVuesaxOutlineHome,
          ),
          const ProfileLisTileWidget(
            title: "المدفوعات",
            image: Assets.imagesVuesaxOutlineHome,
          ),
          const ProfileLisTileWidget(
            title: "المفضلة",
            image: Assets.imagesVuesaxOutlineHome,
          ),
          ProfileLisTileWidget(
              title: "الاشعارات",
              image: Assets.imagesVuesaxOutlineHome,
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              )),
          const ProfileLisTileWidget(
            title: "اللغة",
            image: Assets.imagesVector,
          ),
          ProfileLisTileWidget(
            title: "الوضع",
            image: Assets.imagesVuesaxOutlineHome,
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("data", style: TextStyles.semiBold16),
          ),
             const Padding(
               padding: EdgeInsets.symmetric(vertical: 16.0),
               child: ProfileLisTileWidget(
                         title: "اللغة",
                         image: Assets.imagesVuesaxOutlineHome,
                       ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomButton(onPressed: (){}, text: "text"),
             )
      
        ],
      ),
    );
  }
}

class ProfileLisTileWidget extends StatelessWidget {
  const ProfileLisTileWidget({
    super.key,
    required this.image,
    required this.title,
    this.trailing,
    this.onTap,
  });
  final String image;
  final String title;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 20,
        width: 23,
        child: SvgPicture.asset(
          color: AppColors.lightPrimaryColor,
          image,
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyles.semiBold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF949D9E),
          ),
    );
  }
}

class ProfileEditImage extends StatelessWidget {
  const ProfileEditImage({
    super.key,
    required this.onTap,
    this.image,
  });

  final Function() onTap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            width: 100,
            height: 100,
            imageUrl: " kBaseurl" + (image ?? ''),
            placeholder: (context, url) => Image.asset(
              Assets.imagesAppIcon,
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => Image.asset(
              Assets.imagesAppIcon,
              fit: BoxFit.fill,
            ),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
