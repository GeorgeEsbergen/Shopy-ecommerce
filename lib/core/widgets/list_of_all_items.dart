import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
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
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<ProductModel> products = context.read<HomeCubit>().products;
          return state is HomeDataLoading
              ? const CustomCircleIndicator()
              : ListView.builder(
                  shrinkWrap: shrinkWrap ?? true,
                  physics: physics ?? const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ItemCard(
                    productModel: products[index],
                  ),
                  itemCount: products.length,
                );
        },
      ),
    );
  }
}
