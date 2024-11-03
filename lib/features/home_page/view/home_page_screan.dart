import 'package:con_cards/features/history/history.dart';
import 'package:con_cards/features/main/main.dart';
import 'package:con_cards/features/profile/profile.dart';

import 'package:con_cards/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomePageScrean extends StatefulWidget {
  const HomePageScrean({super.key});

  @override
  State<HomePageScrean> createState() => _HomePageScreanState();
}

class _HomePageScreanState extends State<HomePageScrean> {
  var _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leadingWidth: 100,
            leading: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.monetization_on_outlined,
                    size: 20,
                  ),
                  Text(
                    S.of(context).home_page_screan_total,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex) {
            setState(() => _currentIndex = newIndex);
          },
          children: const [
            MainScrean(),
            HistoryScrean(),
            ProfileScrean(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: theme.hintColor,
            currentIndex: _currentIndex,
            onTap: _openPage,
            items: [
              BottomNavigationBarItem(
                  label: S.of(context).bottomNavigationBarHome,
                  icon: const Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: S.of(context).bottomNavigationBarHistory,
                  icon: const Icon(Icons.history)),
              BottomNavigationBarItem(
                  label: S.of(context).bottomNavigatiomBarPerson,
                  icon: const Icon(Icons.person)),
            ]),
      ),
    );
  }

  void _openPage(newIndex) {
    setState(() => _currentIndex = newIndex);
    _pageController.animateToPage(
      newIndex,
      duration: const Duration(microseconds: 300),
      curve: Curves.linear,
    );
  }
}
