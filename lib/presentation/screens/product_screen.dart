import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:estore/presentation/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/icon_broken.dart';
import '../styles/colors.dart';
import '../widget/custom_bottom_sheet.dart';
import '../widget/selected_filter_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  AppCubit cubit = AppCubit();
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        child: PrimaryButton(
          onPressed: () => false,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: '148 L.E',
                fontSize: 18,
                color: AppColors.lightBackground,
              ),
              CustomText(
                text: 'Add to bag',
                fontSize: 18,
                color: AppColors.lightBackground,
                fontFamily: FontFamily.book,
              ),
            ],
          ),
        ).horizontalPadding(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBackButton(),
                IconButton(
                  onPressed: () {},
                  icon: Container(
                      height: 27.sp,
                      width: 27.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.fillColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                          width: 5.w,
                          ImagesManager.favoriteFill)),
                ),
              ],
            ).endPadding(),
            SizedBox(height: 2.h),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 2.w),
                  child: Image.asset(
                    width: 42.w,
                    height: 30.h,
                    ImagesManager.jacketSample,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomText(
              text: "Men's Harrington Jacket",
              fontSize: 18,
            ),
            SizedBox(
              height: 1.h,
            ),
            const CustomText(
              text: '148 L.E',
              fontSize: 16,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 3.h,
            ),
            PrimaryButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomBottomSheet(
                    text: 'Size',
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: cubit.sizeFilter.map(
                        (e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                return SelectedFilterButton(
                                  text: e.name,
                                  selected: e.selected,
                                  onPressed: () =>
                                      cubit.changeSizeFilter(e.name),
                                );
                              },
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                );
              },
              backgroundColor: WidgetStatePropertyAll(context.fillColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Size',
                    fontSize: 16,
                    fontFamily: FontFamily.book,
                  ),
                  const Spacer(
                    flex: 9,
                  ),
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) => CustomText(
                      text: cubit.selectedSizeName,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Icon(
                    IconBroken.arrowDown2,
                    size: 22.sp,
                    color: context.primaryTextColor,
                  )
                ],
              ),
            ).endPadding(),
            SizedBox(
              height: 1.h,
            ),
            PrimaryButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomBottomSheet(
                    text: 'Color',
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: cubit.colorFilter.map(
                            (e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                return SelectedFilterButton(
                                  text: e.filter.name,
                                  selected: e.filter.selected,
                                  onPressed: () =>
                                      cubit.changeColorFilter(e.filter.name),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 14.sp,
                                        backgroundColor: e.color,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                );
              },

              backgroundColor: WidgetStatePropertyAll(context.fillColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Color',
                    fontSize: 16,
                    fontFamily: FontFamily.book,
                  ),
                  const Spacer(
                    flex: 9,
                  ),
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      return CircleAvatar(
                        backgroundColor: cubit.productSelectedColor,
                        radius: 12.sp,
                      );
                    },
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Icon(
                    IconBroken.arrowDown2,
                    size: 22.sp,
                    color: context.primaryTextColor,
                  )
                ],
              ),
            ).endPadding(),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 0,
                    spreadRadius: 1,
                  ),
                ],
                color: context.fillColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Quantity',
                    fontSize: 16,
                    fontFamily: FontFamily.book,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 10.w,
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
                        size: 19.sp,
                        color: AppColors.lightBackground,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      return CustomText(
                        text: AppCubit.get(context).quantity.toString(),
                        fontFamily: FontFamily.book,
                        fontSize: 20,
                      );
                    },
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 10.w,
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
                        size: 19.sp,
                        color: AppColors.lightBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ).endPadding(),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
                width: 92.w,
                child: CustomText(
                    fontSize: 15,
                    fontFamily: FontFamily.book,
                    color: context.tertiaryTextColor,
                    text:
                        'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.')),
            SizedBox(
              height: 3.h,
            ),
            const CustomText(
              text: 'Shipping & Returns',
              fontSize: 19,
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 92.w,
              child: CustomText(
                fontSize: 15,
                fontFamily: FontFamily.book,
                color: context.tertiaryTextColor,
                text: 'Free standard shipping and free 60-day returns',
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: 96.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesManager.person,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const CustomText(
                    text: 'Alex Morgan',
                    fontSize: 17,
                  ),
                  const Spacer(
                    flex: 12,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: context.fillColor,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: context.fillColor,
                      size: 18.sp,
                    ),
                  ),
                ],
              ).endPadding(),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 92.w,
              child: CustomText(
                fontSize: 15,
                fontFamily: FontFamily.book,
                color: context.tertiaryTextColor,
                text:
                    'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const CustomText(
              text: '12 days ago',
              fontFamily: FontFamily.book,
              fontSize: 16,
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 96.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesManager.person,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const CustomText(
                    text: 'Alex Morgan',
                    fontSize: 17,
                  ),
                  const Spacer(
                    flex: 12,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: context.fillColor,
                      size: 18.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Icon(
                      Icons.star,
                      color: context.fillColor,
                      size: 18.sp,
                    ),
                  ),
                ],
              ).endPadding(),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 92.w,
              child: CustomText(
                fontSize: 15,
                fontFamily: FontFamily.book,
                color: context.tertiaryTextColor,
                text:
                    'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const CustomText(
              text: '12 days ago',
              fontFamily: FontFamily.book,
              fontSize: 16,
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomText(
              text: 'reviews',
              fontSize: 18,
            ),
            SizedBox(
              height: 1.h,
            ),
            const CustomText(
              text: '4.5 Rating',
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomText(
              text: '213 reviews',
              color: context.tertiaryTextColor,
              fontFamily: FontFamily.book,
              fontSize: 15.sp,
            )
          ],
        ).startPadding(),
      ),
    );
  }
}
