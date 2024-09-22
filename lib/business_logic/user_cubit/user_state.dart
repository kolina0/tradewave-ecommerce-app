part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccessState extends UserState {}

final class SignInLoadingState extends UserState {}

final class SignInFailureState extends UserState {
  final String errorMessage;
  SignInFailureState({required this.errorMessage});
}
final class SignUpSuccessState extends UserState {}

final class SignUpLoadingState extends UserState {}

final class SignUpFailureState extends UserState {
  final String errorMessage;
  SignUpFailureState({required this.errorMessage});
}
final class GetUserDataSuccessState extends UserState {
  final UserModel userModel ;

  GetUserDataSuccessState({required this.userModel});
}

final class GetUserDataLoadingState extends UserState {}

final class GetUserDataFailureState extends UserState {
  final dynamic errorMessage;
  GetUserDataFailureState({required this.errorMessage});
}
