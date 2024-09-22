import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/screens/setting_screens/payment_screens/edit_payment_screen.dart';
import 'package:estore/presentation/widget/custom_tapped_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../widget/custom_back_button.dart';
import '../../../widget/custom_text.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBox(
                width: 18.w,
              ),
              const CustomText(
                text: 'Payment',
                fontSize: 19,
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          const CustomText(
            text: 'Cards',
            fontSize: 17,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTappedContainer(
            onTap: () => Navigator.pushNamed(context,editPaymentScreen),
            height: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                const CustomText(
                  text: '**** 1234',
                  fontFamily: FontFamily.book,
                  fontSize: 18,
                ),
                SizedBox(
                  width: 2.w,
                ),
                 SvgPicture.asset(
                    ImagesManager.masterCard,
                ),
                SizedBox(
                  width: 15.w,
                )
              ],
            ),
          ),
          CustomTappedContainer(
            onTap: () => const EditPaymentScreen(),
            height: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                const CustomText(
                  text: '**** 1234',
                  fontFamily: FontFamily.book,
                  fontSize: 18,
                ),
                SizedBox(
                  width: 2.w,
                ),
                 SvgPicture.asset(
                    ImagesManager.masterCard,
                ),
                SizedBox(
                  width: 15.w,
                )
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          const CustomText(
            text: 'Paypal',
            fontSize: 17,
          ),
          SizedBox(
            height: 2.h,
          ),
        CustomTappedContainer(onTap: ()=>false, child:Padding(
          padding: EdgeInsetsDirectional.only(start: 2.w),
          child: SizedBox(
            width: 40.w,
            child: const CustomText(
              text: 'cloth@gmail.com',
              fontFamily: FontFamily.book,
              fontSize: 18,
            ),
          ),
        ), )
        ],
      ).horizontalPadding(),
    );
  }
}
