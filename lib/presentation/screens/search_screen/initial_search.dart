import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/categories_list.dart';
import '../../widget/custom_text.dart';

class InitialSearch extends StatelessWidget {
  const InitialSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 4.h,
        ),
        const CustomText(
          text: 'Shop by category',
          fontSize: 29,
        ),
        SizedBox(
          height: 1.h,
        ),
        const CategoriesList(),
      ],
    );
  }
}
