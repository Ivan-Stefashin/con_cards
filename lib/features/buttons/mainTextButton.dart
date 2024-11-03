import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  MainTextButton(String text, {super.key}) {
    text = text;
  }

  String text = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: theme.textButtonTheme.style?.backgroundColor,
        //shape: ,
      ),
    );
  }
}
