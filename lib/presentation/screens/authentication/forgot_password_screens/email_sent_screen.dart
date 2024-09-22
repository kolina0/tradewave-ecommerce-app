import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/presentation/widget/not_found.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: NotFound(
          image: ImagesManager.emailSent,
          text: 'We Sent you an Email to reset\nyour password.',
          buttonText: 'Return To login',
          onPressed: () => Navigator.pushNamed(context, signInEmailScreen),
        ),
      ),
    );
  }
}
