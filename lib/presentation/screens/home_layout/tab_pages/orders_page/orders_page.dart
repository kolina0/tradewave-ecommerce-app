import 'package:estore/presentation/screens/home_layout/tab_pages/orders_page/no_orders.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../business_logic/app_cubit/app_cubit.dart';
import '../../../../view/order_list_item.dart';
import '../../../../view/order_state_list_item.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  AppCubit cubit = AppCubit();
  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    switch (AppCubit.get(context).orders) {
      case 0:
        {
          return const NoOrders();
        }
      default:
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              const CustomText(
                text: 'Orders',
                fontSize: 20,
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 4.h,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => OrderStateListItem(index),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: 92.w,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const OrderListItem(),
                ),
              ),
            ],
          ),
        );
    }
  }
}
