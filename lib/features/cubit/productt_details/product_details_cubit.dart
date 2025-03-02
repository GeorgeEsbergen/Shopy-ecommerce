import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_with_supabase/features/view_model/rates_model.dart';
import 'package:meta/meta.dart';

import '../../../core/functions/api_services.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();

  List<RatesModel> rates = [];

  Future<void> getRates({required String productId}) async {
    emit(rateLoading());
    try {
      Response response =
          await _apiServices.getData("rates?select=*&product_id=eq.$productId");

      for (var rate in response.data) {
        rates.add(RatesModel.fromJson(rate));
      }
      emit(rateSuccess());
    } catch (e) {
      log(e.toString());
      emit(rateFailure());
    }
  }
}
