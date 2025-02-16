import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<dynamic> LogoutDialog(BuildContext context ,{VoidCallback? logOut}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: const Text('Are you sure you want to Logout?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: logOut,
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
  }
