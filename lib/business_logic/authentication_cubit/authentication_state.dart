part of 'authentication_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class ChangePasswordVisibilityState extends AuthState {}
final class BuyerGenderState extends AuthState {}
final class GenderChoseState extends AuthState {}
final class AgeChoseState extends AuthState {}
