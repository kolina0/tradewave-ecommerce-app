import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../styles/colors.dart';

// i make all sizes auto responsive in this widget
// so don't use any responsive ways with this widget
class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String? text;
  final String fontFamily;
  final Color textColor;
  final WidgetStateProperty<Color?>? backgroundColor;
  final double fontSize;
  final double letterSpacing;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? elevation;
  const PrimaryButton({
    super.key,
    this.width = 100,
    required this.onPressed,
    this.text,
    this.fontFamily = FontFamily.medium,
    this.textColor = AppColors.lightBackground,
    this.backgroundColor ,
    this.fontSize = 17,
    this.letterSpacing = -.5,
    this.child,
    this.height = 6,
    this.padding = EdgeInsets.zero,
    this.contentPadding, this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(elevation),
          padding: WidgetStatePropertyAll(contentPadding),
          backgroundColor: backgroundColor ?? const WidgetStatePropertyAll(AppColors.primary),
        ),
        child: child ??
            Text(
              text ?? '',
              style: TextStyle(
                color: textColor,
                fontFamily: fontFamily,
                fontSize: fontSize.sp,
                letterSpacing: letterSpacing.sp,
              ),
            ),
      ),
    );
  }
}
