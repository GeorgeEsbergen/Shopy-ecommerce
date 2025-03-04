import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_button.dart';
import 'package:e_commerce_with_supabase/features/cubit/login/login_cubit.dart';
import 'package:e_commerce_with_supabase/features/view_model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/widgets/cache_image.dart';
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
                      const CacheImage(
                          url:
                              "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380"),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Product Name"),
                                    Text("5432 LE"),
                                  ],
                                ),
                                Icon(Icons.favorite)
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
                                MainButton(onTap: () {}, name: 'Add to card')
                              ],
                            ),
                            const DeescriptionRow(
                              description:
                                  "FASDL FDA ADSFLASK F AFSLK ASFLKF LASFKLFKSA  FDA ADSFLASK F AFSLK ASFLKF LASFKLFKSA FDA ADSFLASK F AFSLK ASFLKF LASFKLFKSA ",
                              title: 'Description',
                            ),
                            RatingBar.builder(
                              initialRating: cubit.userRate.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
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
                            CommentsListView(
                              productModel: widget.productModel,
                            )
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
