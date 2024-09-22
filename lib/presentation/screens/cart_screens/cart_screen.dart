import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/screens/cart_screens/no_product_cart.dart';
import 'package:estore/presentation/styles/colors.dart';
import 'package:estore/presentation/view/cart_product_list_item.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:estore/presentation/widget/custom_text_form_filled.dart';
import 'package:estore/presentation/widget/price_box.dart';
import 'package:estore/presentation/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets_manager/icon_broken.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    switch (AppCubit.get(context).cartIsEmpty) {
      case true:
        return const NoProductCart();
      default:
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
                      width: 30.w,
                    ),
                    const CustomText(
                      text: 'Cart',
                      fontSize: 22,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                const Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: CustomText(
                    fontFamily: FontFamily.book,
                    text: 'Remove all',
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 92.w,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: const CartProductListItem(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const PriceBox(),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextFormFilled(
                  maxLength: 15,
                  controller: _couponController,
                  keyboardType: TextInputType.text,
                  hintText: 'Enter Coupon Code',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9a-zA-Z]'),
                    ),
                  ],
                  prefixIcon: Padding(
                    padding:const EdgeInsets.all(10),
                    child:
                    SvgPicture.asset(ImagesManager.coupon,),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 27.sp,
                        width: 27.sp,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () => false,
                          icon: Icon(
                            IconBroken.arrowRight2,
                            size: 19.sp,
                            color: AppColors.lightBackground,
                          ),
                        )),
                  ),
                  radius: 15,
                ),
                SizedBox(
                  height: 2.h,
                ),
                PrimaryButton(
                  onPressed: () => Navigator.pushNamed(context, checkoutScreen),
                  text: 'Checkout',
                )
              ],
            ).horizontalPadding(),
          ),
        );
    }
  }
}
