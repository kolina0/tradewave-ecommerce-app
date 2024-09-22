import 'package:estore/business_logic/authentication_cubit/authentication_cubit.dart';
import 'package:estore/business_logic/user_cubit/user_cubit.dart';
import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/router/routes.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:estore/presentation/widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../functions/validation.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_form_filled.dart';
import '../../../widget/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthCubit cubit = AuthCubit();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void didChangeDependencies() {
    cubit = AuthCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    UserCubit.get(context).signUpDispose();
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
                  height: 10.h,
                ),
                const CustomBackButton(),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  padding: EdgeInsetsDirectional.only(bottom: 2.5.h),
                  text: 'Create account',
                  textAlign: TextAlign.start,
                ),
                CustomTextFormFilled(
                  hintText: 'First name',
                  maxLength: 16,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]"),
                    ),
                  ],
                  controller: UserCubit.get(context).signUpFName,
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                  validator: (fName) {
                    if (fName != null) {
                      if (fName.isEmpty) {
                        return 'enter your first name';
                      } else if (fName.length < 2) {
                        return 'enter valid name';
                      }
                    }
                    return null;
                  },
                ),
                CustomTextFormFilled(
                  hintText: 'Last name',
                  maxLength: 16,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]"),
                    ),
                  ],
                  controller: UserCubit.get(context).signUpLName,
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.familyName],
                  validator: (lName) {
                    if (lName != null) {
                      if (lName.isEmpty) {
                        return 'enter your first name';
                      } else if (lName.length < 2) {
                        return 'enter valid name';
                      }
                    }
                    return null;
                  },
                ),
                CustomTextFormFilled(
                  hintText: 'Email Address',
                  maxLength: 32,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"\S"),
                    ),
                  ],
                  controller: UserCubit.get(context).signUpEmail,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: (email) => emailValidation(email),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return CustomTextFormFilled(
                      hintText: 'Password',
                      maxLength: 16,
                      controller: UserCubit.get(context).signUpPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.signUpPasswordVisible,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[a-z0-9@]'),
                        )
                      ],
                      autofillHints: const [AutofillHints.password],
                      validator: (password) => passwordValidation(password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.changeSignUpPasswordIcon(),
                          color: context.primaryColor,
                        ),
                        onPressed: cubit.changeSignUpPasswordVisibility,
                      ),
                    );
                  },
                ),
                BlocConsumer<UserCubit, UserState>(
                  builder: (context, state) {
                    return state is SignUpLoadingState ||
                            state is SignInLoadingState
                        ? const Align(
                            alignment: Alignment.topCenter,
                            child: CircularProgressIndicator(),
                          )
                        : PrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                UserCubit.get(context).signUp();
                              }
                            },
                            text: 'Sign up',
                          );
                  },
                  listener: (BuildContext context, UserState state) {
                    if (state is SignInSuccessState) {
                      Navigator.pushNamed(context, moreInfoScreen);
                    } else if (state is SignInFailureState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                  },
                ),
              ]).horizontalPadding(),
        ),
      ),
    );
  }
}
