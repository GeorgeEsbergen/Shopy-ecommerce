part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class rateLoading extends ProductDetailsState {}

final class rateSuccess extends ProductDetailsState {}

final class rateFailure extends ProductDetailsState {}
