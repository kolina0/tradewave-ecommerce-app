import 'package:estore/business_logic/user_cubit/user_cubit.dart';
import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/widget/action_prompt.dart';
import 'package:estore/presentation/widget/custom_text_form_filled.dart';
import 'package:estore/presentation/widget/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../functions/validation.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/primary_button.dart';

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({super.key});
  @override
  State<SignInEmailScreen> createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 14.h,
              ),
              CustomText(
                padding: EdgeInsetsDirectional.only(bottom: 2.h),
                text: 'Sign in',
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
                controller: UserCubit.get(context).signInEmail,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: (email)=>emailValidation(email),
              ),
              PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, signInPasswordScreen);
                  }
                  },
                text: 'Continue',
              ),
              SizedBox(
                height: 1.h,
              ),
              ActionPrompt(message: "Don't have an account?", actionText: ' Create one', onPressed: () => Navigator.pushNamed(context,signUpScreen,),),
              SizedBox(
                height: 8.h,
              ),
              SocialMediaButton(onPressed: ()=>false, text: 'Continue with apple',svgAsset:ImagesManager.apple ,),
              SizedBox(height: 2.h),
              SocialMediaButton(onPressed: ()=>false, text: 'Continue with google',imageAsset: ImagesManager.google,),
              SizedBox(height: 2.h),
              SocialMediaButton(onPressed: ()=>false, text: 'Continue with facebook',imageAsset: ImagesManager.facebook,),
            ],
          ).horizontalPadding(),
        ),
      ),
    );
  }
}
