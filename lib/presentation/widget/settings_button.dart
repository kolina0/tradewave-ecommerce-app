import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../../core/assets_manager/icon_broken.dart';
import 'custom_text.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height ;
  final Widget? child ;
  const SettingsButton(
      {super.key, required this.onPressed, required this.text, this.height = 7, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: 92.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          color: context.fillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child ?? CustomText(
              text: text,
              fontFamily: FontFamily.book,
              fontSize: 18,
            ),
            Icon(
              IconBroken.arrowRight2,
              color: context.primaryTextColor,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
