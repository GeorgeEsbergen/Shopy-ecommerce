// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_button.dart';
import 'package:e_commerce_with_supabase/features/cubit/login/login_cubit.dart';
import 'package:e_commerce_with_supabase/features/view_model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/list_of_small_items.dart';
import '../../../../core/widgets/search_text_field.dart';
import '../../../cubit/productt_details/product_details_cubit.dart';
import 'widgets/comments.dart';
import 'widgets/description.dart';

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.productModel.name!),
                                    Text(widget.productModel.price!),
                                  ],
                                ),
                                const Icon(Icons.favorite)
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('${cubit.averageRate}'),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                                MainButton(
                                    onTap: () {}, name: 'Buy Now'.tr(context))
                              ],
                            ),
                            const SizedBox(height: 30),
                            DeescriptionRow(
                              description: widget.productModel.description!,
                              title: 'Description'.tr(context),
                            ),
                            const SizedBox(height: 20),
                            Text('Similar Products'.tr(context)),
                            SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: ListOfSmallItems(
                                category: widget.productModel.category,
                                reverseList: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text('Rate Product'.tr(context)),
                            const SizedBox(height: 10),
                            Center(
                              child: RatingBar.builder(
                                initialRating: cubit.userRate.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  cubit.updateOrDeleteUserRate(
                                    data: {
                                      'rate': rating.toInt(),
                                      'user_id': cubit.userID,
                                      'product_id': widget.productModel.id
                                    },
                                    productId: widget.productModel.id!,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            AddCommentTextField(
                              controller: comment,
                              icon: IconButton(
                                  onPressed: () async {
                                    await context
                                        .read<LoginCubit>()
                                        .getUserData();

                                    await cubit.addComment(data: {
                                      "user_id": cubit.userID,
                                      "product_id": widget.productModel.id,
                                      "comment": comment.text,
                                      "user_name": context
                                              .read<LoginCubit>()
                                              .getUserDataModel
                                              ?.name ??
                                          "Known User"
                                    });

                                    comment.clear();
                                  },
                                  icon: const Icon(Icons.send)),
                            ),
                            const SizedBox(height: 20),
                            Text('Reviews'.tr(context)),
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
