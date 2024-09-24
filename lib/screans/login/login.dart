import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConCards'),
      ),
    body: Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Приветствую"),
                  Text("Войдите чтобы продолжить"),
                ],
              ),
            ),
            Expanded(
                child: Column(
                  children: [
                    TextField(),
                    TextField(),
                  ],
                ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}