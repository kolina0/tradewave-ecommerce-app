import 'package:estore/data/api_responses/sign_in_model.dart';
import 'package:estore/data/api_responses/sign_up_model.dart';
import 'package:estore/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);
  final UserRepository userRepo;
  final TextEditingController signInEmail = TextEditingController();
  final TextEditingController signInPassword = TextEditingController();
  final TextEditingController signUpFName = TextEditingController();
  final TextEditingController signUpLName = TextEditingController();
  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();
  final testAvatar = 'https://i.imgur.com/LDOO4Qs.jpg';
  SignInModel? user;
  UserModel? signUpModel;

  void signInDispose() {
    signInEmail.dispose();
    signInPassword.dispose();
  }

  void signUpDispose() {
    signUpFName.dispose();
    signUpLName.dispose();
    signUpEmail.dispose();
    signUpPassword.dispose();
  }

  signUp() async {
    emit(SignUpLoadingState());
    final response = await userRepo.signUp(
      name: '${signUpFName.text} ${signUpLName.text}',
      email: signUpEmail.text,
      password: signUpPassword.text,
      avatar: testAvatar,
    );
    response.fold(
      (errMessage) => emit(SignUpFailureState(errorMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccessState()),
    );
    if (state is SignUpSuccessState) {
      signIn(email: signUpEmail.text, password: signUpPassword.text);
    }
  }

  signIn({
    String? email,
    String? password,
  }) async {
    emit(SignInLoadingState());
    final response = await userRepo.signIn(
      email: email ?? signInEmail.text,
      password: password ?? signInPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignInFailureState(errorMessage: errMessage)),
      (signInModel) => emit(SignInSuccessState()),
    );
  }

  getUserProfile() async {
    emit(GetUserDataLoadingState());
    final response = await userRepo.getUserData();
    response.fold(
      (errMessage) => emit(GetUserDataFailureState(errorMessage: errMessage)),
      (user) => emit(GetUserDataSuccessState(userModel: user)),
    );
  }
}
