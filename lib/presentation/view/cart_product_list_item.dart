import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../core/assets_manager/assets_manager.dart';
import '../styles/colors.dart';
import '../widget/custom_text.dart';

class CartProductListItem extends StatelessWidget {
  final String productName;
  final String color;
  final String? size;
  final double price;
  const CartProductListItem(
      {super.key,
      this.productName = "Men's Harrington Jacket",
      this.size = 'M',
      this.price = 148,
      this.color = 'lemon'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.fillColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 1.w,
          ),
          Image.asset(
            ImagesManager.jacket2,
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: productName,
                fontFamily: FontFamily.book,
                fontSize: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (size != null)
                    Text.rich(TextSpan(
                        text: 'Size-',
                        style: TextStyle(
                          fontFamily: FontFamily.book,
                          fontSize: 15.sp,
                          color: context.tertiaryTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: size,
                            style: TextStyle(
                              fontFamily: FontFamily.bold,
                              color: context.primaryTextColor,
                            ),
                          ),
                        ])),
                  if (size != null)
                    SizedBox(
                      width: 4.w,
                    ),
                  Text.rich(TextSpan(
                      text: 'Color-',
                      style: TextStyle(
                        fontFamily: FontFamily.book,
                        fontSize: 15.sp,
                        color: context.tertiaryTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: color,
                          style: TextStyle(
                            fontFamily: FontFamily.bold,
                            color: context.primaryTextColor,
                          ),
                        ),
                      ])),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 4.w),
                child: CustomText(
                  text: '$price L.E',
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6.w,
                    child: RawMaterialButton(
                      onPressed: () {
                        AppCubit.get(context).increaseQuantity();
                      },
                      elevation: 2.0,
                      fillColor: AppColors.primary,
                      padding: const EdgeInsets.all(2),
                      shape: const CircleBorder(),
                      child: Icon(
                        Icons.add,
                        size: 17.sp,
                        color: AppColors.lightBackground,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      return CustomText(
                        text: AppCubit.get(context).quantity.toString(),
                        fontFamily: FontFamily.book,
                        fontSize: 18,
                      );
                    },
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    width: 6.w,
                    child: RawMaterialButton(
                      onPressed: () {
                        AppCubit.get(context).decreaseQuantity();
                      },
                      elevation: 2.0,
                      fillColor: AppColors.primary,
                      padding: const EdgeInsets.all(2),
                      shape: const CircleBorder(),
                      child: Icon(
                        Icons.remove,
                        size: 17.sp,
                        color: AppColors.lightBackground,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
