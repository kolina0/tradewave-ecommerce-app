import 'package:estore/business_logic/app_cubit/app_cubit.dart';
import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/screens/home_layout/tab_pages/notification_page/no_notification.dart';
import 'package:estore/presentation/view/notification_list_item.dart';
import 'package:estore/presentation/widget/custom_text.dart';
import 'package:estore/presentation/widget/not_found.dart';
import 'package:estore/presentation/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (AppCubit.get(context).notifications) {
      case 0:
        {
          return const NoNotification();
        }
      default:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            const CustomText(
              text: 'Notifications',
              fontSize: 18,
            ),
            SizedBox(
              height: 5.h,
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) =>const NotificationListItem() ,).horizontalPadding(),
          ],
        );
    }
  }
}
