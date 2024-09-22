import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../styles/colors.dart';

class CustomTextFormFilled extends StatelessWidget {
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final int maxLines;
  final int maxLength;
  final bool autocorrect;
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final String obscuringCharacter;
  final String hintText;
  final Widget? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  final Color? cursorColor;
  final double? cursorHeight;
  final Color enabledColor;
  final Color errorColor;
  final Color? hintColor;
  final double enabledWidth;
  final double height;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter>? inputFormatters;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onSubmitted;
  final VoidCallback? onTap;
  const CustomTextFormFilled({
    super.key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.maxLines = 1,
    required this.maxLength,
    this.autocorrect = true,
    this.autofocus = false,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.label,
    this.suffixIcon,
    this.labelStyle,
    this.controller,
    this.keyboardType,
    this.autofillHints,
    this.validator,
    this.cursorColor,
    this.cursorHeight,
    this.enabledColor = Colors.transparent,
    this.errorColor = AppColors.errorColor,
    this.enabledWidth = 1,
    this.margin,
    required this.hintText,
    this.inputFormatters,
    this.radius = 0,
    this.prefixIcon,
    this.height = 9,
    this.padding,
    this.onSubmitted,
    this.readOnly = false,
    this.onTap,
    this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      padding: padding ??
          EdgeInsets.only(
            bottom: 0.5.h,
          ),
      margin: margin,
      child: TextFormField(
        onTap: onTap,
        onFieldSubmitted: onSubmitted,
        readOnly: readOnly,
        style: TextStyle(
            color: context.primaryColor,
            fontSize: 17.sp,
            fontFamily: FontFamily.bold,
            decoration: TextDecoration.none),
        inputFormatters: inputFormatters,
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        autocorrect: autocorrect,
        autofillHints: autofillHints,
        autofocus: autofocus,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLength,
        validator: validator,
        scrollPhysics: const ScrollPhysics(),
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          counterText: '',
          hintText: hintText,
          errorStyle: TextStyle(
            fontSize: 15.sp,
            fontFamily: FontFamily.book,
          ),
          hintStyle: TextStyle(
            color: hintColor ?? context.hintColor,
            fontSize: 17.sp,
            fontFamily: FontFamily.book,
            letterSpacing: -0.41,
          ),
          filled: true,
          label: label,
          labelStyle: labelStyle,
          suffixIcon: suffixIcon,
          fillColor: context.fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: enabledColor,
              width: enabledWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: enabledColor,
              width: enabledWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              width: enabledWidth,
              color: errorColor,
            ),
          ),
        ),
      ),
    );
  }
}
