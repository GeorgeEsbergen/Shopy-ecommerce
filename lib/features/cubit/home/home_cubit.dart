import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_with_supabase/core/functions/api_services.dart';
import 'package:meta/meta.dart';

import '../../view_model/product_model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  Future<void> getProducts() async {
    emit(HomeDataLoading());
    try {
      Response response = await _apiServices
          .getData("products?select=*,favourites(*),purchase(*)");
      for (var product in response.data) {
         products.add(ProductModel.fromJson(product));
      }
      emit(HomeDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(HomeDataFailure());
    }
  }
}
