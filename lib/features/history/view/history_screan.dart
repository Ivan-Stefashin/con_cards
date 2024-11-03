import 'package:con_cards/features/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HistoryScrean extends StatelessWidget {
  const HistoryScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('История'),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
