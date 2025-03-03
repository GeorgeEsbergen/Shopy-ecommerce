// ignore_for_file: camel_case_types

part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}

final class ShowPassword extends LoginState {}

final class LogOutSuccess extends LoginState {}

final class LogOutLoading extends LoginState {}

final class LogOutFailure extends LoginState {
  final String message;

  LogOutFailure({required this.message});
}

final class resetPasswordSuccess extends LoginState {}

final class resetPasswordLoading extends LoginState {}

final class resetPasswordFailure extends LoginState {}

final class getUserDataSuccess extends LoginState {}

final class getUserDataLoading extends LoginState {}

final class getUserDataFailure extends LoginState {}
