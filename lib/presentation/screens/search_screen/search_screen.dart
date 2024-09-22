import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/screens/search_screen/found_search.dart';
import 'package:estore/presentation/screens/search_screen/initial_search.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:estore/presentation/widget/custom_text_form_filled.dart';
import 'package:estore/presentation/widget/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets_manager/assets_manager.dart';
import '../../../core/assets_manager/icon_broken.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  AppCubit cubit = AppCubit();
  final TextEditingController _searchController = TextEditingController();
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                const CustomBackButton(),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: CustomTextFormFilled(
                    padding: EdgeInsets.zero,
                    maxLength: 30,
                    height: 5.75,
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    hintText: 'Search',
                    radius: 30,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z0-9 ]'),
                      ),
                    ],
                    onSubmitted: (value) {
                      cubit.changeState(2);
                      cubit.onSubmitted = true;
                    },
                    suffixIcon: BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: cubit.onSubmitted,
                          child: IconButton(
                            onPressed: () {
                              _searchController.text = '';
                              cubit.onSubmitted = false;
                              cubit.changeState(1);
                            },
                            icon: Icon(
                              Icons.close,
                              color: context.primaryTextColor,
                            ),
                          ),
                        );
                      },
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 4.5.w,
                      ).copyWith(
                        bottom: 0.25.h,
                      ),
                      child: Icon(
                        IconBroken.search,
                        color: context.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                if (state is SearchInitState) {
                  return const InitialSearch();
                } else if (state is NotFoundState) {
                  return const NotFound(
                    image: ImagesManager.search,
                    text:
                        "Sorry, we couldn't find any\nmatching result for your\nSearch.",
                  );
                } else {
                  return const FoundSearch();
                }
              },
            )
          ],
        ).horizontalPadding(),
      ),
    );
  }
}
