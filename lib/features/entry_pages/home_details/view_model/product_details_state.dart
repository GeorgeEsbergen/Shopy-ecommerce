// ignore_for_file: camel_case_types

part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class rateLoading extends ProductDetailsState {}

final class rateSuccess extends ProductDetailsState {}

final class rateFailure extends ProductDetailsState {}


final class addOrUpdateRateLoading extends ProductDetailsState {}

final class addOrUpdateRateSuccess extends ProductDetailsState {}

final class addOrUpdateRateFailure extends ProductDetailsState {}


final class addCommentLoading extends ProductDetailsState {}

final class addCommentSuccess extends ProductDetailsState {}

final class addCommentFailure extends ProductDetailsState {}