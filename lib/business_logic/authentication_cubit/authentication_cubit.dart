import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentication_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  bool passwordVisible = true;
  bool signUpPasswordVisible = true;
  bool isMen = false;
  bool isWomen = false;
  bool genderChose = true;
  String genderName = '';
  bool ageChose = true;
  final List<IconData> _suffixIcons = [Icons.visibility_off, Icons.visibility];


  IconData changePasswordIcon() {
    return passwordVisible ? _suffixIcons[0] : _suffixIcons[1];
  }

  IconData changeSignUpPasswordIcon() {
    return signUpPasswordVisible ? _suffixIcons[0] : _suffixIcons[1];
  }

  void changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(ChangePasswordVisibilityState());
  }

  void changeSignUpPasswordVisibility() {
    signUpPasswordVisible = !signUpPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }


  void buyerIsMen() {
    if (!isMen) {
      isMen = true;
      isWomen = false;
      genderChose = true;
      genderName = 'men';
      emit(BuyerGenderState());
    }
  }

  void buyerIsWomen() {
    if (!isWomen) {
      isWomen = true;
      isMen = false;
      genderChose = true;
      genderName = 'women';
      emit(BuyerGenderState());
    }
  }

  void changeGenderName(String? value) {
    genderName = value ?? 'Women';
  }

  void genderIsChose() {
    if (isWomen == false && isMen == false) {
      genderChose = false;
      emit(GenderChoseState());
    }
  }

  void ageIsChose(String age) {
    if (age.isEmpty) {
      ageChose = false;
      emit(AgeChoseState());
    }
  }

  void changeAgeState(int? index) {
    ageChose = true;
    emit(AgeChoseState());
  }

}
