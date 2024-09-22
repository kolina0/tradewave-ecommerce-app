import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import 'custom_text.dart';
import 'primary_button.dart';

class SocialMediaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? svgAsset;
  final String? imageAsset;
  final String text;
  const SocialMediaButton(
      {super.key,
      required this.onPressed,
      this.svgAsset,
      this.imageAsset,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      backgroundColor: context.socialMediaButtonColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageAsset != null)
            Image.asset(
              imageAsset!,
            ),
          if (svgAsset != null)
            SvgPicture.asset(
                svgAsset!
            ),
          const Spacer(
            flex: 4,
          ),
          CustomText(
            text: text,
            fontFamily: FontFamily.medium,
            fontSize: 18.sp,
            textAlign: TextAlign.center,
            letterSpacing: -0.5,
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
