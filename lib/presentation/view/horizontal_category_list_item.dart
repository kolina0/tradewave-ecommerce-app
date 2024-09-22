import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../core/assets_manager/assets_manager.dart';
import '../widget/custom_text.dart';

class HorizontalCategoryListItem extends StatelessWidget {
  final int index;
  const HorizontalCategoryListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 23.sp,
          backgroundColor: context.fillColor,
          child: Stack(children: [
            Positioned(
              bottom: 0.7.h,
              left: 1.w,
              child: Image.asset(
                height: 8.5.h,
                fit: BoxFit.fill,
                AppCubit.get(context).categoryPreview[index].image,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomText(
          text: AppCubit.get(context).categoryPreview[index].name,
          fontSize: 16.sp,
          fontFamily: FontFamily.book,
        )
      ],
    );
  }
}
