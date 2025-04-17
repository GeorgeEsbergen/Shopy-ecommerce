// ignore_for_file: camel_case_types

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/utils/font_style.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../../../core/widgets/search_text_field.dart';
import '../../../../auth/login/view_model/login_cubit.dart';
import '../../view_model/product_details_cubit.dart';
import '../home_details_body.dart';

class addComment extends StatelessWidget {
  const addComment({
    super.key,
    required this.comment,
    required this.cubit,
    required this.widget,
  });

  final TextEditingController comment;
  final ProductDetailsCubit cubit;
  final HomeDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return AddCommentTextField(
      controller: comment,
      icon: IconButton(
          onPressed: () async {
            if (comment.text.isNotEmpty) {
              await context.read<LoginCubit>().getUserData();

              await cubit.addComment(data: {
                "user_id": cubit.userID,
                "product_id": widget.productModel.id,
                "comment": comment.text,
                "user_name":
                    context.read<LoginCubit>().getUserDataModel?.name ??
                        "Known User"
              });

              comment.clear();
            } else {
              mainSnackBar(context, " please ,enter Comment");
            }
          },
          icon: const Icon(Icons.send)),
    );
  }
}

class userRating extends StatelessWidget {
  const userRating({
    super.key,
    required this.cubit,
    required this.widget,
  });

  final ProductDetailsCubit cubit;
  final HomeDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        initialRating: cubit.userRate.toDouble(),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
    );
  }
}

class rateAndBuyRow extends StatelessWidget {
  const rateAndBuyRow({
    super.key,
    required this.cubit,
    required this.widget,
  });

  final ProductDetailsCubit cubit;
  final HomeDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '${cubit.averageRate}',
              style: AppFonts.b14_600,
            ),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentView(
                    onPaymentSuccess: () {},
                    onPaymentError: () {},
                    price: double.parse(widget.productModel.price!),
                    // , // Required: Total price (e.g., 100 for 100 EGP)
                  ),
                ),
              );
            },
            name: 'Buy Now'.tr(context))
      ],
    );
  }
}

class itemMainDetails extends StatelessWidget {
  const itemMainDetails({
    super.key,
    required this.widget,
  });

  final HomeDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.productModel.name!, style: AppFonts.b14_600),
            Text(widget.productModel.price!, style: AppFonts.b14_600),
          ],
        ),
        const Icon(Icons.favorite)
      ],
    );
  }
}
