import 'package:estore/core/assets_manager/assets_manager.dart';
import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final double letterSpacing;
  final double? height;
  final EdgeInsetsGeometry padding;
  final String fontFamily;
  final TextOverflow? overflow;
  const CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.textDirection,
    this.textAlign,
    this.color ,
    this.fontSize = 32,
    this.letterSpacing = -0.41,
    this.height,
    this.padding = EdgeInsets.zero,
    this.fontFamily = FontFamily.bold, this.overflow,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        maxLines: maxLines,
        textDirection: textDirection,
        textAlign: textAlign,
        overflow:overflow ,
        style: TextStyle(
          fontFamily: fontFamily,
          color: color ?? context.primaryTextColor,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          height: height,
        ),
      ),
    );
  }
}
