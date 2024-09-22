import 'package:estore/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/assets_manager/icon_broken.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/primary_button.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({super.key});

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  final TextEditingController _ageController = TextEditingController();
  AuthCubit cubit = AuthCubit();

  @override
  void didChangeDependencies() {
    cubit = AuthCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              padding: EdgeInsetsDirectional.only(bottom: 7.h),
              text: 'Tell us about yourself',
              textAlign: TextAlign.start,
              fontSize: 26,
            ),
            CustomText(
              padding: EdgeInsetsDirectional.only(bottom: 2.h),
              text: 'What do you shop for ?',
              textAlign: TextAlign.start,
              fontSize: 19,
              fontFamily: FontFamily.book,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      onPressed: cubit.buyerIsMen,
                      text: 'Men',
                      fontFamily: FontFamily.book,
                      width: 43,
                      backgroundColor: cubit.isMen
                          ? WidgetStatePropertyAll(context.primaryColor)
                          : WidgetStatePropertyAll(context.fillColor),
                      textColor: cubit.isMen
                          ? context.secondaryTextColor
                          : context.primaryTextColor,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    PrimaryButton(
                      onPressed: cubit.buyerIsWomen,
                      text: 'Women',
                      width: 43,
                      backgroundColor: cubit.isWomen
                          ? WidgetStatePropertyAll(context.primaryColor)
                          : WidgetStatePropertyAll(context.fillColor),
                      textColor: cubit.isWomen
                          ? context.secondaryTextColor
                          : context.primaryTextColor,
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Visibility(
                  visible: !cubit.genderChose,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(bottom: 1.h,top: 1.h),
                    child: const CustomText(
                      text: 'you must choose gender',
                      color: Colors.red,
                      fontFamily: FontFamily.book,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 7.h,
            ),
            CustomText(
              padding: EdgeInsetsDirectional.only(bottom: 2.h,),
              text: 'How old are you ?',
              textAlign: TextAlign.start,
              fontSize: 19,
              fontFamily: FontFamily.book,
            ),
            DropdownMenu(
              dropdownMenuEntries: List<DropdownMenuEntry<int>>.generate(
                150,
                (index) {
                  return DropdownMenuEntry(
                      value: ++index, label: index.toString());
                },
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('[0-9]'),
                ),
              ],
              onSelected: (value) => cubit.changeAgeState(value),
              width: 90.w,
              hintText: 'Age',
              controller: _ageController,
              menuHeight: 30.h,
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
                  fontFamily: FontFamily.book,
                  color: context.primaryTextColor,
                  fontSize: 18.sp),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(
                  color: context.primaryTextColor,
                  fontFamily: FontFamily.book,
                  fontSize: 17.sp,
                ),
                contentPadding: EdgeInsetsDirectional.only(start: 6.w),
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
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Visibility(
                  visible: !cubit.ageChose,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(bottom: 1.h,top: 1.h),
                    child: const CustomText(
                      text: 'you must choose age',
                      color: Colors.red,
                      fontFamily: FontFamily.book,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            PrimaryButton(
              onPressed: () {
                cubit.genderIsChose();
                cubit.ageIsChose(_ageController.text);
                if (cubit.ageChose && cubit.genderChose) {
                  Navigator.pushNamedAndRemoveUntil(context, homeLayout, (route) => false,);
                }
              },
              text: 'Finish',
            ),
          ],
        ).horizontalPadding(),
      ),
    );
  }
}
