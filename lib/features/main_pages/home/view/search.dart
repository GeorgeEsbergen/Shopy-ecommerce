import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/list_of_all_items.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Search Results'.tr(context)),
          centerTitle: true,
        ),
        body: ListView(
          children: [ListOfItems(query: query,)],
        ));
  }
}
