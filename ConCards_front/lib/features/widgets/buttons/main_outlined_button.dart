import 'package:flutter/material.dart';

class MainOutlinedButton extends StatelessWidget {
  MainOutlinedButton({this.onPressed, required this.text, super.key});

  var onPressed;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 3, color: Color.fromRGBO(0, 21, 170, 1)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(0, 21, 170, 1),
        ),
      ),
    );
  }
}
