part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeDataLoading extends HomeState {}

final class HomeDataSuccess extends HomeState {}

final class HomeDataFailure extends HomeState {}

final class addToFavLoading extends HomeState {}

final class addToFavSuccess extends HomeState {}

final class addToFavFailure extends HomeState {}

final class deleteFromFavLoading extends HomeState {}

final class deleteFromFavSuccess extends HomeState {}

final class deleteFromFavFailure extends HomeState {}


final class BuyProductLoading extends HomeState {}

final class BuyProductDone extends HomeState {}

final class BuyProductError extends HomeState {}


