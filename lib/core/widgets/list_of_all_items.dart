import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cubit/home/home_cubit.dart';
import '../../features/view_model/product_model/product_model.dart';
import 'item_card.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key,
    this.shrinkWrap,
    this.physics,
    this.query,
    this.category,
    this.isFavScreen = false,  this.isMyOrders= false,
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
                      ? homeCubit.favouriteProducts :isMyOrders!? homeCubit.userOrders
                      : context.read<HomeCubit>().products;
          return state is HomeDataLoading
              ? const CustomCircleIndicator()
              : products.isEmpty
                  ? Center(
                      child: Text('No Results To show'),
                    )
                  : ListView.builder(
                      shrinkWrap: shrinkWrap ?? true,
                      physics: physics ?? const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ItemCard(
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
                        },
                        isFav: homeCubit.checkIfFav(products[index].id!),
                      ),
                      itemCount: products.length,
                    );
        },
      ),
    );
  }
}
