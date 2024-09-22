import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/icon_broken.dart';

class CustomBackButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  const CustomBackButton({
    super.key,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 27.sp,
        width: 27.sp,
        alignment: Alignment.center,
        margin: margin,
        decoration: BoxDecoration(
          color: context.fillColor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed:onPressed ?? () => Navigator.pop(context),
          icon: Icon(
            IconBroken.arrowLeft2,
            size: 19.sp,
          ),
        ));
  }
}
