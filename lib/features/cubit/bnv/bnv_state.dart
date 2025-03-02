part of 'bnv_cubit.dart';

@immutable
sealed class BnvState {}

final class BnvInitial extends BnvState {}

final class ChangeIndexPage extends BnvState {}
