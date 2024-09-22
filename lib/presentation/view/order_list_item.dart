import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_tapped_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/assets_manager/assets_manager.dart';
import '../../core/assets_manager/icon_broken.dart';
import '../styles/colors.dart';
import '../widget/custom_text.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTappedContainer(
      onTap: ()=>Navigator.pushNamed(context,orderDetailsScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            IconBroken.document,
            size: 21.sp,
            color: context.primaryTextColor,
          ).horizontalPadding(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Order #456789',
                fontFamily: FontFamily.medium,
                fontSize: 17.sp,
              ),
              CustomText(
                text: '4 items',
                fontSize: 14.sp,
                fontFamily: FontFamily.book,
                textAlign: TextAlign.start,
                color: context.tertiaryTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
