import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../core/assets_manager/assets_manager.dart';
import '../styles/colors.dart';

class OrderStateListItem extends StatefulWidget {
  final int index ;
  const OrderStateListItem(this.index,{super.key});

  @override
  State<OrderStateListItem> createState() => _OrderStateListItemState();
}

class _OrderStateListItemState extends State<OrderStateListItem> {
  AppCubit cubit =AppCubit();
  @override
  void didChangeDependencies() {
    cubit =AppCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      width: 25.w,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () => cubit.changeOrderStatus(widget.index),
            style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 4.w),
              ),
              backgroundColor: WidgetStatePropertyAll(
                cubit.allStatus[widget.index].statusDone
                    ? context.primaryColor
                    : context.fillColor,
              ),
            ),
            child: Text(
              cubit.allStatus[widget.index].statusName,
              style: TextStyle(
                color: cubit.allStatus[widget.index].statusDone
                    ? AppColors.lightBackground
                    : context.primaryTextColor,
                fontFamily: FontFamily.book,
                fontSize: 15.sp,
              ),
            ),
          );
        },
      ),
    ).startPadding();
  }
}
