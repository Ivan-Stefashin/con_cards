import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: ListView(
          children: [
            SizedBox(
              child:
                Text('Панель выбора из трех разделов с одной лентой'),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [

                ],
              ),
            ),
            SizedBox(
              child: Text('Кнопка оформить новый продутк'),
            ),
            SizedBox(
              child: Text('Карусель с предложениями'),
            ),
            SizedBox(
              child: Text('Карусель с популярными платежами и переводами'),
            ),
            SizedBox(
              child: Text('Карусель с валютами'),
            ),
          ],
        ),
        bottomNavigationBar: Text('bottomNavigationBar'),
      ),
    );
  }
}