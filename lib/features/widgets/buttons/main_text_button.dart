import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  MainTextButton({var this.onPressed, required String this.text, super.key}) {}

  var onPressed;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromRGBO(0, 21, 170, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Сохранить',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
