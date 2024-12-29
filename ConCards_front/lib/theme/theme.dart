import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  primaryColor: const Color.fromRGBO(0, 32, 255, 1.0),
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 32, 255, 1.0)),
);

final lightTeme = ThemeData(
    primaryColor: const Color.fromRGBO(0, 32, 255, 1.0),
    hintColor: Colors.grey,
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 32, 255, 1.0)),
    useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll(Color.fromRGBO(0, 21, 170, 1)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(15, 16, 21, 1.0),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 3, color: Color.fromRGBO(0, 21, 170, 1)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(0, 21, 170, 1),
        ),
      ),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 25)));
