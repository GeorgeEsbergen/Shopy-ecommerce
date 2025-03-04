import 'package:e_commerce_with_supabase/core/widgets/custom_indicator.dart';
import 'package:e_commerce_with_supabase/features/view_model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: Supabase.instance.client
            .from("comments")
            .stream(primaryKey: ['id'])
            .eq('product_id', productModel.id!)
            .order('created_at'),
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? data =
              snapshot.data as List<Map<String, dynamic>>?;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomCircleIndicator();
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("There is no comments to show"),
            );
          } else {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => commentData(
                getcommentData: data[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: data!.length ?? 0,
            );
          }
        });
  }
}

class commentData extends StatelessWidget {
  const commentData({
    super.key,
    required this.getcommentData,
  });
  final Map<String, dynamic> getcommentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
            ),
            title: Text(getcommentData['user_name']),
            subtitle: Text(getcommentData['comment']),
          ),
          getcommentData['reply'] != null
              ? ListTile(
                  title: Text(
                    'Reply',
                    style: TextStyle(color: Colors.blue),
                  ),
                  subtitle: Text(getcommentData['reply']),
                )
              : Container()
        ],
      ),
    );
  }
}
