import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String title ;
  final String date ;
  final bool enabled ;
  const CustomListTile({super.key, required this.title, this.date = '28 May', required this.enabled});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: enabled
          ? SvgPicture.asset(
        ImagesManager.check,
        height: 3.h,
      )
          : SvgPicture.asset(
        ImagesManager.checkDisable,
        height: 3.h,
      ),
      title: Text(
        title,
      ),

      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontFamily: FontFamily.book,
        color: enabled
            ? context.primaryTextColor
            : context.tertiaryTextColor,
      ),
      trailing: CustomText(
        text: date,
        fontFamily: FontFamily.book,
        fontSize: 14.sp,
        color: enabled
            ? context.primaryTextColor
            : context.tertiaryTextColor,
      ),
      enabled: enabled,
    );
  }
}
