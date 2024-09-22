import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/view/horizontal_category_list_item.dart';
import 'package:estore/presentation/view/product_list_item.dart';
import 'package:estore/presentation/widget/custom_text_form_filled.dart';
import 'package:estore/presentation/widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/assets_manager/icon_broken.dart';
import '../../../styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppCubit appCubit = AppCubit();
  AuthCubit authCubit = AuthCubit();
  @override
  void didChangeDependencies() {
    appCubit = AppCubit.get(context);
    authCubit = AuthCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 6.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                maxRadius: 17.5.sp,
                child: Image.asset(
                  ImagesManager.profilePic,
                  fit: BoxFit.fill,
                ),
              ),
              DropdownMenu(
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'Men', label: 'Men'),
                  DropdownMenuEntry(value: 'Women', label: 'Women')
                ],
                onSelected: (value) =>
                    authCubit.changeGenderName(value as String),
                width: 29.w,
                hintText: 'gender',
                initialSelection: authCubit.genderName.isEmpty
                    ? 'Women'
                    : authCubit.genderName,
                trailingIcon: const Icon(
                  IconBroken.arrowDown2,
                ),
                menuStyle: MenuStyle(
                  backgroundColor:
                      context.dropDownMenuColor,
                ),
                selectedTrailingIcon: const Icon(
                  IconBroken.arrowUp2,
                ),
                textStyle: TextStyle(
                    fontFamily: FontFamily.bold,
                    color: context.primaryTextColor,
                    fontSize: 15.sp),
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: TextStyle(
                    color: context.primaryTextColor,
                    fontFamily: FontFamily.book,
                    fontSize: 17.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.sp),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23.sp),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  fillColor: context.dropDownMenuFillColor,
                  filled: true,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, cartScreen);
                },
                icon: const Icon(
                  IconBroken.bag,
                ),
                style: ButtonStyle(
                  minimumSize: const WidgetStatePropertyAll(Size(40, 40)),
                  shape: const WidgetStatePropertyAll(CircleBorder()),
                  backgroundColor:
                       WidgetStatePropertyAll(context.primaryColor),
                  iconColor: const WidgetStatePropertyAll(AppColors.lightBackground),
                  iconSize: WidgetStatePropertyAll(18.sp),
                ),
              ),
            ],
          ).horizontalPadding(),
          SizedBox(
            height: 2.h,
          ),
           CustomTextFormFilled(
            maxLength: 30,
            hintText: 'Search',
            height: 7,
            readOnly: true,
            onTap: () {
              appCubit.changeState(1);
              Navigator.pushNamed(context, searchScreen);
            },
             hintColor: context.primaryTextColor,
             prefixIcon: Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 4.5.w)
                   .copyWith(bottom: 0.5.h),
               child: Icon(
                 IconBroken.search,
                 color: context.primaryTextColor,
               ),
             ),
             radius: 30,
           ).horizontalPadding(),
          SizedBox(height: 1.h),
          SectionHeader(
            sectionName: 'Categories',
            onPressed: () {
              Navigator.pushNamed(context, allCategoriesScreen);
            },
          ),
          SizedBox(
            height: 12.h,
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 3.w,
                );
              },
              itemBuilder: (context, index) {
                return HorizontalCategoryListItem(index: index);
              },
            ).horizontalPadding(),
          ),
          SectionHeader(sectionName: 'Top selling', onPressed: () => false),
          SizedBox(
            height: 30.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ProductListItem();
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SectionHeader(
            sectionName: 'New products',
            onPressed: () => false,
          ),
          SizedBox(
            height: 30.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ProductListItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
