import 'package:estore/presentation/styles/themes.dart';
import 'package:flutter/material.dart';

import '../../core/assets_manager/assets_manager.dart';
import 'custom_text.dart';

class PriceRow extends StatelessWidget {
  final String priceOf;
  final double price ;
  const PriceRow({super.key, required this.priceOf, required this.price});

  @override
  Widget build(BuildContext context) {
    return                 Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: priceOf,
          fontSize: 18,
          fontFamily: FontFamily.book,
          color: context.tertiaryTextColor,
        ),
         CustomText(
          text: '$price L.E',
          fontSize: 18,
          fontFamily: FontFamily.book,
        ),
      ],
    )
    ;
  }
}
