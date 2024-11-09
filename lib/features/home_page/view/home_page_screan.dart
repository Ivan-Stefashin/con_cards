import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:con_cards/features/history/history.dart';
import 'package:con_cards/features/main/main.dart';
import 'package:con_cards/features/profile/profile.dart';

import 'package:con_cards/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    final _future =
        Supabase.instance.client.from('Products').select('balance.sum()');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 50,
                  height: 50,
                ),
              ),
              Text(S.of(context).nameOfApp,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(80, 80, 80, 1))),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex) {
            setState(() => _currentIndex = newIndex);
          },
          children: const [
            MainScrean(),
            HistoryScrean(),
            ProfileScrean(),
            TestSupaBase(),
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
              const BottomNavigationBarItem(
                  label: 'тест', icon: Icon(Icons.settings)),
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

class TestSupaBase extends StatefulWidget {
  const TestSupaBase({
    super.key,
  });

  @override
  State<TestSupaBase> createState() => _TestSupaBaseState();
}

class _TestSupaBaseState extends State<TestSupaBase> {
  final _future = Supabase.instance.client.from('Users').select();
  //.filter('email', 'eq', FirebaseAuth.instance.currentUser?.email); //SupabaseQueryBuilder(schema: )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: ((context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['first_name']),
              );
            }),
          );
        },
      ),
    );
  }
}
