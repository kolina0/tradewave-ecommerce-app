import 'package:estore/functions/extensions.dart';
import 'package:estore/presentation/widget/custom_text_form_filled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/custom_back_button.dart';
import '../../../widget/custom_text.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final TextEditingController _sAddressController=TextEditingController();
  final TextEditingController _cityController=TextEditingController();
  final TextEditingController _stateController=TextEditingController();
  final TextEditingController _codeController=TextEditingController();
  @override
  void dispose() {
    _sAddressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _codeController.dispose();
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
                text: 'Edit address',
                fontSize: 19,
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          CustomTextFormFilled(maxLength: 30, controller: _sAddressController, keyboardType: TextInputType.text, hintText: 'Street address',
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp('[0-9a-zA-Z]'),
              ),
            ],
            radius: 10,
          ),
          CustomTextFormFilled(maxLength: 30, controller: _cityController, keyboardType: TextInputType.text, hintText: 'City',
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp('[0-9a-zA-Z]'),
              ),
            ],
            radius: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 45.w,
                child:CustomTextFormFilled(maxLength: 30, controller: _stateController, keyboardType: TextInputType.text, hintText: 'State',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[a-zA-Z]'),
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
                child: CustomTextFormFilled(maxLength: 30, controller: _codeController, keyboardType: TextInputType.text, hintText: 'Zip code',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9]'),
                    ),
                  ],
                  radius: 10,
                )
              ),
            ],
          )
        ],
      ).horizontalPadding(),
    );
  }
}
