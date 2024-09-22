import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../widget/custom_text.dart';
import '../../../../widget/not_found.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.h),
          const CustomText(
            text: 'Orders',
            fontSize: 18,
          ),
          const NotFound(image: ImagesManager.noOrder, text: 'No orders yet'),
        ],
      ),
    );
  }
}
