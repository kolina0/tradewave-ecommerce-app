import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../widget/custom_text.dart';

class CategoryListItem extends StatelessWidget {
  final String imageAsset ;
  final String categoryName ;
  const CategoryListItem({super.key, this.imageAsset =ImagesManager.jacket, this.categoryName ='Accessories'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:1.h),
      child: Container(
        height: 8.h,
        width: 92.w,
        decoration: BoxDecoration(
          color:context.fillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23.sp,
              backgroundColor: context.fillColor,
              child: Stack(children: [
                Positioned(
                  bottom: 0.7.h,
                  left: 1.w,
                  child: Image.asset(
                    height: 7.5.h,
                    fit: BoxFit.fill,
                    ImagesManager.jacket,
                  ),
                ),
              ]),
            ),
            Positioned(
              left: 20.w,
              bottom: 2.5.h,
              child: CustomText(text: categoryName,fontFamily: FontFamily.book,
                fontSize: 18.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
