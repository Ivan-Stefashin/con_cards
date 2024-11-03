import 'package:con_cards/features/history/history.dart';
import 'package:con_cards/features/home_page/home_page.dart';
import 'package:con_cards/features/profile/profile.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        currentIndex: _currentIndex,
        onTap: _openPage(_currentIndex),
        items: const [
          BottomNavigationBarItem(
              label: 'Главная', //S.of(context).bottomNavigationBarHome,
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'История', //S.of(context).bottomNavigationBarHistory,
              icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              label: 'Профиль', //S.of(context).bottomNavigatiomBarPerson,
              icon: Icon(Icons.person)),
        ]);
  }

  _openPage(int newIndex) {
    setState(() {
      _currentIndex = newIndex;

      // if (_currentIndex == 0) {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => const HomePageScrean()));
      // } else if (_currentIndex == 1) {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => const HistoryScrean()));
      // } else if (_currentIndex == 2) {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => const ProfileScrean()));
      // }
    });
  }
}
