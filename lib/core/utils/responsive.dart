import 'package:flutter/material.dart';

class AppResp {
  final BuildContext context;

  AppResp(this.context);

  Size get size => MediaQuery.of(context).size;
}
