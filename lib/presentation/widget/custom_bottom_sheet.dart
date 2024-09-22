import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'custom_text.dart';

class CustomBottomSheet extends StatelessWidget {
  final String text ;
  final Widget child ;
  const CustomBottomSheet({super.key, required this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 6,
            ),
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 34.w,
                ),
                 CustomText(
                  text: text,
                  fontSize: 24,
                ),
                SizedBox(
                  width: 25.w,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: context.primaryTextColor,
                    size: 21.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            child,
          ],
        ).horizontalPadding(),
      ),
    );
  }
}
