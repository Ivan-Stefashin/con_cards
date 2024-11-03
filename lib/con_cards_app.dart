import 'package:flutter/material.dart';
import 'package:con_cards/theme/theme.dart';
import 'package:con_cards/localization/localization.dart';
import 'package:con_cards/router/router.dart';

class ConCardsApp extends StatelessWidget {
  const ConCardsApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      //locale: Locale('en'),
      theme: lightTeme,
      routes: routes,
      //initialRoute: '/',
    );
  }
}
