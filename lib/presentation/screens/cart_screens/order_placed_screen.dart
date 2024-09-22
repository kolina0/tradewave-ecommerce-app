import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/colors.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:estore/presentation/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: context.bottomNavigationBarColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            const CustomText(
              text: 'Order placed \n Successfully',
              fontSize: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomText(
              text: 'You will receive an email confirmation',
              fontSize: 17,
              fontFamily: FontFamily.book,
              color: context.tertiaryTextColor,
            ),
            SizedBox(
              height: 8.h,
            ),
            PrimaryButton(
              onPressed: () => false,
              text: 'See Order details',
            )
          ],
        ).horizontalPadding(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Image.asset(
                ImagesManager.computer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
