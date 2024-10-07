import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:con_cards/auth/auth_controller.dart';
import 'package:con_cards/screens/homePage.dart';
import 'package:con_cards/screens/login/logIn.dart';
import 'package:con_cards/screens/login/welcome.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    var FirstName;
    var LastName;
    var Patronymic;
    var Email;
    var Password;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Welcome()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.87,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Здравствуйте !",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 10, 57, 1.0),
                      ),
                    ),
                    Text(
                      "Создайте новый аккаунт",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Фамилия',
                      ),
                      onChanged: (String value) {
                        LastName = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Имя',
                      ),
                      onChanged: (String value) {
                        FirstName = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Отчество',
                      ),
                      onChanged: (String value) {
                        Patronymic = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      onChanged: (String value) {
                        Email = value;
                      },
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      onChanged: (String value) {
                        Password = value;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Authentication().Auth(
                            FirstName, LastName, Patronymic, Email, Password);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const Text(
                        'зарегистрироваться',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            const Text(
              'Уже есть аккаунт?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                'Войти',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 21, 170, 1),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
