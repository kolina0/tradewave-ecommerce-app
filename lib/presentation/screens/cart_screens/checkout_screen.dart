import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_tapped_container.dart';
import 'package:estore/presentation/widget/price_box.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/assets_manager/assets_manager.dart';

import '../../styles/colors.dart';
import '../../widget/custom_back_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/primary_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                const CustomBackButton(),
                SizedBox(
                  width: 24.w,
                ),
                const CustomText(
                  text: 'Checkout',
                  fontSize: 22,
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomTappedContainer(onTap: ()=>false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Shipping Address',
                        fontFamily: FontFamily.book,
                        color: context.tertiaryTextColor,
                        fontSize: 15,
                      ),
                       CustomText(
                        text: 'Add Shipping Address',
                        fontSize: 18,
                        fontFamily: FontFamily.book,
                        textAlign: TextAlign.start,
                        color: context.primaryTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomTappedContainer(onTap: ()=>false, child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Shipping Address',
                      fontFamily: FontFamily.book,
                      color: context.tertiaryTextColor,
                      fontSize: 15,
                    ),
                     CustomText(
                      text: 'Add Shipping Address',
                      fontSize: 18,
                      fontFamily: FontFamily.book,
                      textAlign: TextAlign.start,
                      color: context.primaryTextColor,
                    ),
                  ],
                ),
              ],
            ),),
            SizedBox(
              height: 28.h,
            ),
            const PriceBox(),
            SizedBox(
              height:  11.h,
            ),
            PrimaryButton(onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context,orderPlacedScreen,(route) => false,),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: '208 L.E',
                    color: AppColors.lightBackground,
                      fontSize: 16,
                    ),
                    CustomText(text: 'Place Order',
                    fontSize: 16,
                      fontFamily: FontFamily.book,
                      color: AppColors.lightBackground,
                    )
                  ],
                ),
            )
          ],
        ).horizontalPadding(),
      ),
    );
  }
}
