import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../view/product_list_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.w,
      child: GridView.builder(
        itemBuilder: (context, index) => const ProductListItem(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 3.h,
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
