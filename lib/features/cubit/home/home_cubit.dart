import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_with_supabase/core/functions/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../view_model/product_model/favourite.dart';
import '../../view_model/product_model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;

  List<ProductModel> products = [];
  List<ProductModel> filterdProducts = [];
  List<ProductModel> categoryProducts = [];
  List<ProductModel> favouriteProducts = [];
  Future<void> getProducts({String? query, String? category}) async {
    products = [];
     filterdProducts = [];
    categoryProducts = [];
    favouriteProducts = [];
    emit(HomeDataLoading());
    try {
      Response response = await _apiServices
          .getData("products?select=*,favourites(*),purchase(*)");
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      
      fitlterdProducts(query);
      fitlterdProductsByCategory(category);
      favouriteProduct();
      emit(HomeDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(HomeDataFailure());
    }
  }

  void fitlterdProducts(String? query) {
    if (query != null) {
      for (var product in products) {
        if (product.name!.toLowerCase().contains(query.toLowerCase())) {
          filterdProducts.add(product);
        }
      }
    }
  }

  void fitlterdProductsByCategory(String? category) {
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase() ==
            category.trim().toLowerCase()) {
          categoryProducts.add(product);
        }
      }
    }
  }

  Map<String, bool> allFavourites = {};
  Future<void> addToFavourite(String productId) async {
    emit(addToFavLoading());
    try {
      _apiServices.postData('favourites',
          {'is_favourite': true, 'user_id': userId, 'product_id': productId});
      allFavourites.addAll({productId: true});
      emit(addToFavSuccess());
    } catch (e) {
      emit(addToFavFailure());
    }
  }

  bool checkIfFav(String productId) {
    return allFavourites.containsKey(productId);
  }

  Future<void> deleteFromFavourite(String productId) async {
    emit(deleteFromFavLoading());
    try {
      _apiServices.deleteData(
        'favourites?user_id=eq.$userId&product_id=eq.$productId',
      );
      await getProducts();
      allFavourites.removeWhere((key, value) => key == productId);
      emit(deleteFromFavSuccess());
    } catch (e) {
      emit(deleteFromFavFailure());
    }
  }

  void favouriteProduct() {
    for (ProductModel product in products) {
      if (product.favourites != null && product.favourites!.isNotEmpty) {
        for (Favourite fav in product.favourites!) {
          if (fav.userId == userId) {
            favouriteProducts.add(product);
            allFavourites.addAll({product.id!: true});
          }
        }
      }
    }
  }
}
