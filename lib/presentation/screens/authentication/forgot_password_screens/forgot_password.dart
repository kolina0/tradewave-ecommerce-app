import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../router/routes.dart';
import '../../../../functions/validation.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_form_filled.dart';
import '../../../widget/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void dispose()
  {
    _emailEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            const CustomBackButton(),
            SizedBox(
              height: 2.h,
            ),
            CustomText(
              padding: EdgeInsetsDirectional.only(bottom: 2.5.h),
              text: 'Forgot Password',
              textAlign: TextAlign.start,
            ),
            CustomTextFormFilled(
              hintText: 'Email Address',
              maxLength: 32,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r"\S"),
                ),
              ],
              controller: _emailEditingController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              validator: (email) =>
                  emailValidation(email),
            ),
            SizedBox(
              height: 3.h,
            ),
            PrimaryButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, emailSentScreen);
                }
              },
              text: 'Continue',
            ),
          ],
        ).horizontalPadding(),
      ),
    );
  }
}
