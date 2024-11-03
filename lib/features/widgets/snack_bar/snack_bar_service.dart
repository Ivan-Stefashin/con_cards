import 'package:flutter/material.dart';

class SnackbarService {
  static const okColor = Colors.green;
  static const errorColor = Colors.red;

  static Future<void> showSnackBar(
      BuildContext context, String massege, bool error) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(massege),
      backgroundColor: error ? errorColor : okColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
