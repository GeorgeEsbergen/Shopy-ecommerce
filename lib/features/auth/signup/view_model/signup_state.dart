part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}

final class AddUserDataSuccess extends SignupState {}

final class AddUserDataLoading extends SignupState {}

final class AddUserDataFailure extends SignupState {}

final class ShowPassword extends SignupState {}
