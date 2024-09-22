import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:estore/presentation/widget/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../styles/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.h,
        ),
        CircleAvatar(
          radius: 30.sp,
          backgroundImage: const AssetImage(ImagesManager.jacketSample,),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
          height: 11.h,
          decoration: BoxDecoration(
            color: context.fillColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  const CustomText(text: 'Gilbert Jones',
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  CustomText(text: 'Glbertjones001@gmail.com',
                  color: context.tertiaryTextColor,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    fontSize: 16,
                    fontFamily: FontFamily.book,
                  ),
                  CustomText(text: '121-224-7890',
                  color: context.tertiaryTextColor,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    fontSize: 16,
                    fontFamily: FontFamily.book,
                  ),
                ],
              ),
              TextButton(onPressed: ()=>false, child: CustomText(
                text: 'edit',
                color: context.primaryColor,
                fontSize: 15,
              ),),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        SettingsButton(onPressed: ()=>Navigator.pushNamed(context,addressScreen), text: 'Address'),
        SizedBox(height: 1.h,),
        SettingsButton(onPressed: ()=>Navigator.pushNamed(context,favouriteScreen), text: 'favourite'),
        SizedBox(height: 1.h,),
        SettingsButton(onPressed: ()=>Navigator.pushNamed(context,paymentScreen), text: 'Payment'),
        SizedBox(height: 1.h,),
        SettingsButton(onPressed: ()=>false, text: 'Help'),
        SizedBox(height: 1.h,),
        SettingsButton(onPressed: ()=>false, text: 'Support'),
        SizedBox(height: 3.h,),
        TextButton(onPressed: ()=>false, child: const CustomText(
          text: 'Sign out',
          fontSize: 22,
          color: AppColors.errorColor,
        ))
      ],
    ).horizontalPadding();
  }
}
