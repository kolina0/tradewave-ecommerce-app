import 'package:estore/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:estore/business_logic/user_cubit/user_cubit.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/action_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../business_logic/app_cubit/app_cubit.dart';
import '../../../router/routes.dart';
import '../../../../functions/validation.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_form_filled.dart';
import '../../../widget/primary_button.dart';

class SignInPasswordScreen extends StatefulWidget {
  const SignInPasswordScreen({super.key});

  @override
  State<SignInPasswordScreen> createState() => _SignInPasswordScreenState();
}

class _SignInPasswordScreenState extends State<SignInPasswordScreen> {
  AuthCubit cubit = AuthCubit();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void didChangeDependencies() {
    cubit = AuthCubit.get(context);
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    UserCubit.get(context).signInDispose();
    super.dispose();
  }
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
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return CustomTextFormFilled(
                    hintText: 'Password',
                    maxLength: 16,
                    controller: UserCubit.get(context).signInPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: cubit.passwordVisible,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z0-9]'),
                      ),
                    ],
                    autofillHints: const [AutofillHints.password],
                    validator: (password) => passwordValidation(password),
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.changePasswordIcon(),
                        color: context.primaryColor,
                      ),
                      onPressed: cubit.changePasswordVisibility,
                    ),
                  );
                },
              ),
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return state is SignInLoadingState
                      ? const Align(
                    alignment: Alignment.topCenter,
                      child: CircularProgressIndicator())
                      : PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              UserCubit.get(context).signIn();
                            if(state is SignInSuccessState)
                              {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  homeLayout,
                                      (route) => false,
                                );
                              }
                            }
                          },
                          text: 'Log in',
                        );
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              ActionPrompt(
                message: "Forgot Password?",
                actionText: ' Reset',
                onPressed: () => Navigator.pushNamed(
                  context,
                  forgotPasswordScreen,
                ),
                actionTextWidth: 10.w,
              )
            ],
          ).horizontalPadding(),
        ),
      ),
    );
  }
}
