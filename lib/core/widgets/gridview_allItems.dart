// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cubit/home/home_cubit.dart';
import '../../features/view_model/product_model/product_model.dart';
import 'gridview_item_card.dart';

class GridViewOfItems extends StatelessWidget {
  const GridViewOfItems({
    super.key,
    this.shrinkWrap,
    this.physics,
    this.query,
    this.category,
    this.isFavScreen = false,
    this.isMyOrders = false,
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final String? query;
  final String? category;
  final bool isFavScreen;
  final bool? isMyOrders;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getProducts(query: query, category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();
          List<ProductModel> products = query != null
              ? context.read<HomeCubit>().filterdProducts
              : category != null
                  ? context.read<HomeCubit>().categoryProducts
                  : isFavScreen
                      ? homeCubit.favouriteProducts
                      : isMyOrders!
                          ? homeCubit.userOrders
                          : context.read<HomeCubit>().products;
          return state is HomeDataLoading
              ? const CustomCircleIndicator()
              : products.isEmpty
                  ? const Center(
                      child: Text('No Results To show'),
                    )
                  : GridView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GridviewItemCard(
                        onPaymentSuccess: () async {
                          await homeCubit.buyProduct(
                              productId: products[index].id!);
                          mainSnackBar(context, "Product added to Orders");
                        },
                        productModel: products[index],
                        favBTN: () {
                          bool isFavourite =
                              homeCubit.checkIfFav(products[index].id!);
                          isFavourite
                              ? homeCubit
                                  .deleteFromFavourite(products[index].id!)
                              : homeCubit.addToFavourite(products[index].id!);
                          isFavourite
                              ? mainSnackBar(
                                  context, "Item removed from favourites")
                              : mainSnackBar(
                                  context, "Item added to favourites");
                        },
                        isFav: homeCubit.checkIfFav(products[index].id!),
                      ),
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 220,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                    );
        },
      ),
    );
  }
}
