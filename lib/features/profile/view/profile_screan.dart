import 'package:con_cards/features/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Профиль'),
      ),
      //bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
