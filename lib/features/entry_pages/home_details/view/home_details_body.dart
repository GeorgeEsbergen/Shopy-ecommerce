// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/utils/font_style.dart';
import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/list_of_small_items.dart';
import '../../../main_pages/home/model/product_model.dart';
import '../view_model/product_details_cubit.dart';
import 'widgets/comments.dart';
import 'widgets/description.dart';
import 'widgets/home_datails_widgets.dart';

class HomeDetailsBody extends StatefulWidget {
  const HomeDetailsBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<HomeDetailsBody> createState() => _HomeDetailsBodyState();
}

class _HomeDetailsBodyState extends State<HomeDetailsBody> {
  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocProvider(
        create: (context) =>
            ProductDetailsCubit()..getRates(productId: widget.productModel.id!),
        child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (context, state) {
            if (state is addOrUpdateRateSuccess) {
              // Should add navigation to update rate
            }
          },
          builder: (context, state) {
            ProductDetailsCubit cubit = context.read<ProductDetailsCubit>();
            return state is rateLoading
                ? const CustomCircleIndicator()
                : ListView(
                    children: [
                      CacheImage(
                          url: widget.productModel.image_url ??
                              "https://tzhflhqdshribwlaiehi.supabase.co/storage/v1/object/public/images//empty.jpg"),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            itemMainDetails(widget: widget),
                            const SizedBox(height: 15),
                            rateAndBuyRow(cubit: cubit, widget: widget),
                            const SizedBox(height: 30),
                            DeescriptionRow(
                              description: widget.productModel.description!,
                              title: 'Description'.tr(context),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Similar Products'.tr(context),
                              style: AppFonts.b16_700,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: ListOfSmallItems(
                                category: widget.productModel.category,
                                reverseList: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Rate Product'.tr(context),
                              style: AppFonts.b16_700,
                            ),
                            const SizedBox(height: 10),
                            userRating(cubit: cubit, widget: widget),
                            const SizedBox(height: 20),
                            addComment(
                                comment: comment, cubit: cubit, widget: widget),
                            const SizedBox(height: 20),
                            Text(
                              'Reviews'.tr(context),
                              style: AppFonts.b16_700,
                            ),
                            const SizedBox(height: 20),
                            CommentsListView(
                              productModel: widget.productModel,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }
}
