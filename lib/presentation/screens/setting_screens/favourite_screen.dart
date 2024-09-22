import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/widget/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/custom_back_button.dart';
import '../../widget/custom_text.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  SizedBox(
                    width: 22.w,
                  ),
                  const CustomText(
                    text: 'My favourite',
                    fontSize: 19,
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              const ProductGrid()
            ],
          ).horizontalPadding(),
      ),
    );
  }
}
