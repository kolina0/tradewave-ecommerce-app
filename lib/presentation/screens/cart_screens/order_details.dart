import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/colors.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets_manager/icon_broken.dart';
import '../../widget/custom_list_tile.dart';


class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
                text: 'Order #456789',
                fontSize: 19,
              )
            ],
          ).horizontalPadding(),
          SizedBox(
            height: 4.h,
          ),
          const CustomListTile(
            title: 'Delivered',
            enabled: false,
          ),
          SizedBox(
            height: 3.h,
          ),
          const CustomListTile(
            title: 'Shipped',
            enabled: true,
          ),
          SizedBox(
            height: 3.h,
          ),
          const CustomListTile(
            title: 'Order Confirmed',
            enabled: true,
          ),
          SizedBox(
            height: 3.h,
          ),
          const CustomListTile(
            title: 'Order Placed',
            enabled: true,
          ),
          SizedBox(
            height: 3.h,
          ),
          const CustomText(
            text: 'Order items',
            fontSize: 18,
          ).startPadding(),
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 9.h,
            width: 92.w,
            decoration: BoxDecoration(
              color: context.fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  IconBroken.document,
                  size: 21.sp,
                  color: context.primaryTextColor,
                ).horizontalPadding(),
                CustomText(
                  text: '4 items',
                  fontSize: 17.sp,
                  textAlign: TextAlign.start,
                  fontFamily: FontFamily.medium,
                ),
                SizedBox(
                  width: 45.w,
                ),
                CustomText(
                  text: 'view all',
                  fontSize: 16.sp,
                  color: AppColors.primary,
                ),
              ],
            ),
          ).horizontalPadding(),
          SizedBox(
            height: 5.h,
          ),
          const CustomText(
            text: 'Shipping details',
            fontSize: 18,
          ).startPadding(),
          SizedBox(height: 2.h),
          Container(
            height: 9.h,
            width: 92.w,
            decoration: BoxDecoration(
              color: context.fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start:3.w,top: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: '2715 Ash Dr. San Jose, South Dakota 83475',fontFamily: FontFamily.book,fontSize: 16.sp,),
                  CustomText(text: '121-224-7890',fontFamily: FontFamily.book,fontSize: 16.sp,),
                ],
              ),
            ),
          ).horizontalPadding(),
        ],
      ),
    );
  }
}
