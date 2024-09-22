import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/icon_broken.dart';

class CustomTappedContainer extends StatelessWidget {
  final VoidCallback onTap ;
  final double height ;
  final Widget child ;
  const CustomTappedContainer({super.key, required this.onTap, this.height = 9, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height.h,
          width: 92.w,
          decoration: BoxDecoration(
            color: context.fillColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              child,
              SizedBox(
                width: 40.w,
              ),
              Icon(
                IconBroken.arrowRight2,
                color: context.primaryTextColor,
                size: 22.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
