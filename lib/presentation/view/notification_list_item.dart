import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import '../../core/assets_manager/icon_broken.dart';
import '../widget/custom_text.dart';

class NotificationListItem extends StatelessWidget {
  final String notificationMessage ;
  final bool notSeen ;
  const NotificationListItem({super.key, this.notificationMessage ='hello', this.notSeen = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Container(
        height: 9.h,
        width: 92.w,
        decoration: BoxDecoration(
          color: context.fillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 4.w,
            ),
            Stack(
                children:[
                  Icon(
                    IconBroken.notification,
                    size: 22.sp,
                  ),
                  Visibility(
                    visible: notSeen,
                    child: Positioned(
                      right: 1.w,
                      top: 0.3.h,
                      child: CircleAvatar(
                        radius: 8.sp,
                        backgroundColor: Colors.red,
                      ),),
                  ),
                ]
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: 70.w,
              child: CustomText(
                text:notificationMessage,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                fontFamily: FontFamily.book,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
