import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../styles/colors.dart';
import '../../../widget/custom_back_button.dart';
import '../../../widget/custom_text.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBox(
                width: 18.w,
              ),
              const CustomText(
                text: 'Address',
                fontSize: 19,
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
            height: 9.h,
            decoration: BoxDecoration(
              color: context.fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width:70.w,
                  child: const CustomText(text: '2715 Ash Dr. San Jose, South Dakota 83475',
                  fontSize: 18,
                    fontFamily: FontFamily.book,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(onPressed: ()=>Navigator.pushNamed(context,editAddressScreen), child: const CustomText(
                  text: 'edit',
                  color: AppColors.primary,
                  fontSize: 15,
                ),),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
            height: 9.h,
            decoration: BoxDecoration(
              color: context.fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width:70.w,
                  child: const CustomText(text: '2715 Ash Dr. San Jose, South Dakota 83475',
                    fontSize: 18,
                    fontFamily: FontFamily.book,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(onPressed: ()=>false, child: const CustomText(
                  text: 'edit',
                  color: AppColors.primary,
                  fontSize: 15,
                ),),
              ],
            ),
          ),
        ],
      ).horizontalPadding(),
    );
  }
}
