// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/utils/font_style.dart';
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
    this.isFavScreen = false,
    this.isMyOrders = false,
    this.reverseList,
    this.direction,
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final String? query;
  final String? category;
  final bool isFavScreen;
  final bool? isMyOrders;
  final bool? reverseList;
  final Axis? direction;
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
                  ? Center(
                      child: Text('No Results To show'.tr(context) ,style: AppFonts.b16_700,),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      scrollDirection: direction ?? Axis.vertical,
                      reverse: reverseList ?? false,
                      shrinkWrap: shrinkWrap ?? true,
                      physics: physics ?? const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ItemCard(
                        onPaymentSuccess: () async {
                          await homeCubit.buyProduct(
                              productId: products[index].id!);
                          mainSnackBar(
                              context, "Product added to Orders".tr(context));
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
                              ? mainSnackBar(context,
                                  "Item removed from favourites".tr(context))
                              : mainSnackBar(context,
                                  "Item added to favourites".tr(context));
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
