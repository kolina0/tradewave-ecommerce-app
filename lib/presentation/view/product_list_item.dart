import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../widget/custom_text.dart';

class ProductListItem extends StatefulWidget {
  final String imageAsset;
  final String text;
  final double price;
  final double? priceBeforeSale;
  const ProductListItem(
      {super.key,
      this.imageAsset = ImagesManager.jacket,
      this.text = "men's hirgnton jacket ",
      this.price = 60,
      this.priceBeforeSale = 80});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  AppCubit cubit = AppCubit();
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.fillColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 7.h,
            right: 2.w,
            child: SizedBox(
              child: Image.asset(
                widget.imageAsset,
                height: 30.h,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            right: 1.w,
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () => cubit.changeFavourite(),
                  icon:
                  SvgPicture.asset(
                    cubit.isFavourite
                        ? ImagesManager.favoriteFill
                        : ImagesManager.favoriteOutline,
                    height: 19.sp,
                    width: 19.sp,
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 1.5.w,
            bottom: 4.h,
            child: CustomText(
              text: widget.text,
              fontFamily: FontFamily.book,
              fontSize: 15.sp,
            ),
          ),
          Positioned(
            left: 1.5.w,
            bottom: 1.5.h,
            child: Row(
              children: [
                CustomText(
                  text: widget.price.toString(),
                  fontSize: 15.sp,
                ),
                CustomText(
                  text: " EGP",
                  fontSize: 13.sp,
                ),
                Visibility(
                  visible: widget.priceBeforeSale == null ? false : true,
                  child: Stack(
                      children: [
                    Row(
                      children: [
                        CustomText(
                          text: "  ${widget.priceBeforeSale}",
                          fontSize: 15.sp,
                          color: context.tertiaryTextColor,
                        ),
                        CustomText(
                          text: " EGP",
                          fontSize: 13.sp,
                          color: context.tertiaryTextColor,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 1,
                      left: 1,
                      child: SizedBox(
                        width: 100,
                        child: Divider(
                          height: 20,
                          indent: 1.w,
                          endIndent: 5.w,
                          color: context.tertiaryTextColor,
                          thickness: 1,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    ).startPadding();
  }
}
