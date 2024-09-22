import 'package:estore/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';
import '../../../core/assets_manager/assets_manager.dart';
import '../../widget/custom_bottom_sheet.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_form_filled.dart';
import '../../widget/filter_button.dart';
import '../../widget/product_grid.dart';
import '../../widget/selected_filter_button.dart';

class FoundSearch extends StatefulWidget {
  const FoundSearch({super.key});

  @override
  State<FoundSearch> createState() => _FoundSearchState();
}

class _FoundSearchState extends State<FoundSearch> {
  AppCubit cubit=AppCubit();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  @override
  void didChangeDependencies() {
    cubit =AppCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 4.h,
              width: 12.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: AppColors.lightBackground,
                  ),
                  CustomText(
                    text: ' 2 ',
                    fontFamily: FontFamily.book,
                    fontSize: 15,
                    color: AppColors.lightBackground,
                  ),
                ],
              ),
            ),
            FilterButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomBottomSheet(
                    text: 'Deals',
                    child: ListView(
                      shrinkWrap: true,
                      children: cubit.dealsFilter.map(
                            (e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child:
                            BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                return SelectedFilterButton(
                                  text: e.name,
                                  selected: e.selected,
                                  onPressed: () =>
                                      cubit.changeDeals(e.name),
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
              width: 12,
              primaryColor: false,
              showArrow: false,
              text: ' Deals',
            ),
            FilterButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => CustomBottomSheet(
                  text: 'Price',
                  child: Column(
                    children: [
                      CustomTextFormFilled(
                        radius: 50,
                        maxLength: 5,
                        controller: _minPriceController,
                        keyboardType: TextInputType.number,
                        hintText: 'Min',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                      ),
                      CustomTextFormFilled(
                        maxLength: 5,
                        controller: _maxPriceController,
                        keyboardType: TextInputType.number,
                        hintText: 'Max',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        radius: 50,
                      ),
                    ],
                  ),
                ),
              ),
              width: 17,
              primaryColor: true,
              showArrow: true,
              text: ' price',
            ),
            FilterButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomBottomSheet(
                    text: 'Sort by',
                    child: ListView(
                      shrinkWrap: true,
                      children: cubit.sortByFilter.map(
                            (e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child:
                            BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                return SelectedFilterButton(
                                  text: e.name,
                                  selected: e.selected,
                                  onPressed: () =>
                                      cubit.changeSortBy(e.name),
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
              width: 20,
              primaryColor: false,
              showArrow: true,
              text: ' Sort by',
            ),
            FilterButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => CustomBottomSheet(
                    text: 'Gender',
                    child: ListView(
                      shrinkWrap: true,
                      children: cubit.genderFilter.map(
                            (e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child:
                            BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                return SelectedFilterButton(
                                  text: e.name,
                                  selected: e.selected,
                                  onPressed: () => cubit
                                      .changeGenderFilter(e.name),
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
              width: 20,
              primaryColor: true,
              showArrow: true,
              text: 'Gender',
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        const CustomText(
          text: '53 Results found',
          fontFamily: FontFamily.book,
          fontSize: 15,
        ),
        SizedBox(
          height: 2.h,
        ),
        const ProductGrid(),
      ],
    );
  }
}
