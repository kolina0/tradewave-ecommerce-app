import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../styles/colors.dart';
import 'custom_text.dart';
import 'primary_button.dart';

class SelectedFilterButton extends StatefulWidget {
  final String text ;
  final bool selected ;
  final VoidCallback onPressed;
  final Widget? child ;
  const SelectedFilterButton({super.key, required this.text, required this.selected, required this.onPressed, this.child});

  @override
  State<SelectedFilterButton> createState() => _SelectedFilterButtonState();
}

class _SelectedFilterButtonState extends State<SelectedFilterButton> {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: widget.onPressed,
      backgroundColor: widget.selected ?const WidgetStatePropertyAll(AppColors.primary) : WidgetStatePropertyAll(context.fillColor) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50.w,
            child: CustomText(
              text: widget.text,
              fontSize: 16,
              color: widget.selected ?AppColors.lightBackground :context.primaryTextColor,
              fontFamily: FontFamily.medium,
            ),
          ),
          if (widget.child != null && widget.selected)
            SizedBox(width: 1.w),
          if (widget.child != null) widget.child!,
          Visibility(
            visible: widget.selected,
            child: Icon(
              Icons.check,
              color: AppColors.lightBackground,
              size: 21.sp,
            ),
          ),
        ],
      ),
    );
  }
}
