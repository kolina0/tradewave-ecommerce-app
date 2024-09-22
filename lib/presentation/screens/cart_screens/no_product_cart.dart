import 'package:estore/functions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets_manager/assets_manager.dart';
import '../../widget/custom_back_button.dart';
import '../../widget/not_found.dart';

class NoProductCart extends StatelessWidget {
  const NoProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          const CustomBackButton().startPadding(),
          const NotFound(
              image: ImagesManager.cart, text: 'Your Cart is Empty'),
        ],
      ),
    );
  }
}
