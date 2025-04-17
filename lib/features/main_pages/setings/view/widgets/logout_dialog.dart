import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<dynamic> LogoutDialog(BuildContext context, {VoidCallback? logOut}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text('Confirmation'.tr(context)),
        content:  Text('Are you sure you want to Logout?'.tr(context)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child:  Text(
              'Cancel'.tr(context),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: logOut,
            child:  Text(
              'Log out'.tr(context),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
