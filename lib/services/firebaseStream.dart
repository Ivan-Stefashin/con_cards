import 'package:con_cards/screens/homePage.dart';
import 'package:con_cards/screens/login/logIn.dart';
import 'package:con_cards/screens/login/login1.dart';
import 'package:con_cards/screens/login/verifyEmailScreen.dart';
import 'package:con_cards/screens/login/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseStream extends StatelessWidget {
  const FireBaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Что-то пошло не так!'),
            ),
          );
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const VerifyEmailScreen();
          }
          return const HomePage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
