import 'package:estore/functions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/custom_back_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_form_filled.dart';

class EditPaymentScreen extends StatefulWidget {
  const EditPaymentScreen({super.key});

  @override
  State<EditPaymentScreen> createState() => _EditPaymentScreenState();
}

class _EditPaymentScreenState extends State<EditPaymentScreen> {
  final TextEditingController _cardNumController=TextEditingController();
  final TextEditingController _cvvController=TextEditingController();
  final TextEditingController _expController=TextEditingController();
  final TextEditingController _cardNameController=TextEditingController();
  @override
  void dispose()
  {
    _cardNameController.dispose();
    _cardNumController.dispose();
    _cvvController.dispose();
    _expController.dispose();
    super.dispose();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBox(
                width: 22.w,
              ),
              const CustomText(
                text: 'Edit payment',
                fontSize: 19,
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextFormFilled(maxLength: 16, controller: _cardNumController, keyboardType: TextInputType.number, hintText: 'Card number',
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp('[0-9]'),
              ),
            ],
            radius: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 45.w,
                child:           CustomTextFormFilled(maxLength: 3, controller: _cvvController, keyboardType: TextInputType.number, hintText: 'CVV',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9]'),
                    ),
                  ],
                  radius: 10,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              SizedBox(
                width: 45.w,
                child:          CustomTextFormFilled(maxLength: 5, controller: _expController, keyboardType: TextInputType.number, hintText: 'Exp',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9]'),
                    ),
                  ],
                  radius: 10,
                ),
              ),
            ],
          ),
          CustomTextFormFilled(maxLength: 16, controller: _cardNameController, keyboardType: TextInputType.number, hintText: 'CardHolder name',
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp('[a-zA-Z]'),
              ),
            ],
            radius: 10,
          ),
        ],
      ).horizontalPadding(),
    );
  }
}
