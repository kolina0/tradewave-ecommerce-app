import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension DefaultPadding on Widget
{
  /// Adds symmetric horizontal padding to the widget
  Widget horizontalPadding ()
  {
    return Padding(padding: EdgeInsetsDirectional.symmetric(horizontal : 4.w),
      child: this,
    );
  }
  Widget customSliverPadding ()
  {
    return SliverPadding(padding: EdgeInsetsDirectional.symmetric(horizontal : 4.w),
      sliver: this,
    );
  }
  /// Adds padding only to the start (left) of the widget
  Widget startPadding ()
  {
    return Padding(padding: EdgeInsetsDirectional.only(start: 4.w),
      child: this,
    );
  }
  Widget endPadding ()
  {
    return Padding(padding: EdgeInsetsDirectional.only(end: 4.w),
      child: this,
    );
  }
}