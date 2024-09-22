import 'package:estore/presentation/widget/price_row.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const PriceRow(priceOf: 'Subtotal', price: 200),
        SizedBox(
          height: 1.h,
        ),
        const PriceRow(priceOf: 'Shipping Cost', price: 8.00),
        SizedBox(
          height: 1.h,
        ),
        const PriceRow(priceOf: 'Tax', price: 0.00),
        SizedBox(
          height: 1.h,
        ),
        const PriceRow(priceOf: 'Total', price: 208),
      ],
    );
  }
}
