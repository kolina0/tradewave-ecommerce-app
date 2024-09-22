import 'package:estore/presentation/styles/colors.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../../core/assets_manager/icon_broken.dart';
import 'custom_text.dart';
import 'primary_button.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final bool primaryColor;
  final bool showArrow;
  final String text;
  const FilterButton({
    super.key,
    required this.onPressed,
    required this.width,
    required this.primaryColor,
    required this.showArrow,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: PrimaryButton(
        onPressed: onPressed,
        width: width,
        elevation: 0.5,
        height: 4,
        contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor:
            primaryColor ? const WidgetStatePropertyAll(AppColors.primary) : WidgetStatePropertyAll(context.fillColor),
        child: Row(
          children: [
            CustomText(
              text: text,
              fontFamily: FontFamily.book,
              fontSize: 14,
              textAlign: TextAlign.center,
              color:
                  primaryColor ?AppColors.lightBackground  :context.primaryTextColor ,
            ),

            Visibility(
              visible: showArrow,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 1.w),
                child: Icon(
                  IconBroken.arrowDown2,
                  color:
                  primaryColor ?AppColors.lightBackground  :context.primaryTextColor  ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
