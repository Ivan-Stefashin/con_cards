import 'package:con_cards/features/login/login.dart';
import 'package:con_cards/features/sign_up/sign_up.dart';
import 'package:con_cards/generated/l10n.dart';
import 'package:flutter/material.dart';

class WelcomeScrean extends StatelessWidget {
  const WelcomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Center(
            child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.87,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
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
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Image.asset(
                'assets/images/man_with_laptop.png',
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  Text(
                    S.of(context).welcomeHello,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      //fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(0, 10, 57, 1.0),
                    ),
                  ),
                  Text(
                    S.of(context).welcomeMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                    child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        S.of(context).signIn,
                        style: const TextStyle(
                          //fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                  child: Center(
                      child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        S.of(context).registeration,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(0, 21, 170, 1),
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
