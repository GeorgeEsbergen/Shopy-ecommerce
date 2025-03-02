part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

// ignore: camel_case_types
final class changeLanuageState extends LocalizationState {
  final Locale locale;

  changeLanuageState({required this.locale});
}
