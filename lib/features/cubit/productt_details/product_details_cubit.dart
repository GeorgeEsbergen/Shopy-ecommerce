import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_with_supabase/features/view_model/rates_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/functions/api_services.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();

  List<RatesModel> rates = [];
  int averageRate = 0;
  int userRate = 0;
  var userID = Supabase.instance.client.auth.currentUser!.id;

  Future<void> getRates({required String productId}) async {
    emit(rateLoading());
    try {
      Response response =
          await _apiServices.getData("rates?select=*&product_id=eq.$productId");

      for (var rate in response.data) {
        rates.add(RatesModel.fromJson(rate));
      }
      _getAverageRate();
      List<RatesModel> userRates =
          rates.where((rate) => rate.userId == userID).toList();
      if (userRates.isNotEmpty) {
        userRate = userRates[0].rate!;
      }
      log(averageRate.toString());
      emit(rateSuccess());
    } catch (e) {
      log(e.toString());
      emit(rateFailure());
    }
  }

  void _getAverageRate() {
    for (var rate in rates) {
      if (rate.rate != null) {
        averageRate += rate.rate!;
      }
    }
    if (rates.isNotEmpty) {
      averageRate = averageRate ~/ rates.length;
    }
  }

  bool isUserExist({required String productId}) {
    for (var rate in rates) {
      if ((rate.userId == userID) && (rate.productId == productId)) {
        return true;
      }
    }
    return false;
  }

  Future<void> updateOrDeleteUserRate(
      {required String productId, required Map<String, dynamic> data}) async {
    String path = "rates?user_id=eq.$userID&product_id=eq.$productId";
    emit(addOrUpdateRateLoading());
    try {
      if (isUserExist(productId: productId)) {
        await _apiServices.patchData(path, data);
      } else {
        await _apiServices.postData(path, data);
      }
      emit(addOrUpdateRateSuccess());
    } catch (e) {
      emit(addOrUpdateRateFailure());
    }
  }

  Future<void> addComment({required Map<String, dynamic> data}) async {
    emit(addCommentLoading());
    try {
      await _apiServices.postData('comments', data);
      emit(addCommentSuccess());
    } catch (e) {
      emit(addCommentFailure());
    }
  }
}
