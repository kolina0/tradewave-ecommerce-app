import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:estore/presentation/widget/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.h,
            ),
            const CustomBackButton(),
            SizedBox(
              height: 3.h,
            ),
            CustomText(
              text: "Jackets (${AppCubit.get(context).categoryPreview.length})",
              fontSize: 18.sp,
            ),
            const ProductGrid(),
          ],
        ).horizontalPadding(),
      ),
    );
  }
}
