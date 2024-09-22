import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/widget/categories_list.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../styles/colors.dart';

class AllCategories extends StatelessWidget {
    const AllCategories({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
                CustomBackButton(
                 onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(context, homeLayout,(route) => false,);
                 },
              ),
              SizedBox(height: 2.h,),
              const CustomText(text: 'Shop by category',
              fontSize: 29,
              ),
              SizedBox(height:1.h),
             const CategoriesList(),
            ],
          ).horizontalPadding(),
        ),
      );
    }
  }
