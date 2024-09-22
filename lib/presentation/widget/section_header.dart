import 'package:estore/functions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import 'custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName ;
  final VoidCallback onPressed ;
  const SectionHeader({super.key, required this.sectionName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: sectionName,
          fontSize: 18,
          textAlign: TextAlign.start,
        ),
        TextButton(
          onPressed: onPressed,
          child: CustomText(
            text: 'See All',
            fontFamily: FontFamily.book,
            fontSize: 18,
          ),
        ),
      ],
    ).horizontalPadding();
  }
}
