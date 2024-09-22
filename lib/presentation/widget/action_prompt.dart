import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/assets_manager/assets_manager.dart';
import 'custom_text.dart';

class ActionPrompt extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onPressed ;
  final double? actionTextWidth ;
  const ActionPrompt({super.key, required this.message, required this.actionText, required this.onPressed, this.actionTextWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: message,
          fontSize: 15.sp,
          fontFamily: FontFamily.book,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 3.h,
          width: actionTextWidth,
          child: TextButton(
            onPressed: onPressed,
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
              splashFactory: NoSplash.splashFactory,
              shadowColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            child: CustomText(
              text: actionText,
              fontFamily: FontFamily.bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
