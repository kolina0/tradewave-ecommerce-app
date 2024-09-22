import 'package:estore/presentation/router/routes.dart';
import 'package:estore/presentation/widget/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/assets_manager/assets_manager.dart';
import 'custom_text.dart';

class NotFound extends StatelessWidget {
  final double height;
  final String image;
  final String text;
  final String buttonText;
  final VoidCallback? onPressed ;
  const NotFound({
    super.key,
    this.height = 20,
    required this.image,
    required this.text, this.buttonText ='Explore categories', this.onPressed ,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height.h,
          ),
          Image.asset(
            image,
            height: 20.h,
          ),
          CustomText(
            text: text,
            fontFamily: FontFamily.book,
            fontSize: 25,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.h,
          ),
          PrimaryButton(
            onPressed: onPressed ?? () => Navigator.pushNamedAndRemoveUntil(context,allCategoriesScreen,(route) => false,),
            text: buttonText,
            width: 50,
          ),
        ],
      ),
    );
  }
}
