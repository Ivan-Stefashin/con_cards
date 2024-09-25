import 'package:con_cards/screens/login/logIn.dart';
import 'package:con_cards/screens/login/welcome.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Welcome()));
          },
            icon: Icon(Icons.arrow_back),
          ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.87,
          child: Column(
            children: [
              Expanded(
                //flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Здравствуйте !",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 10, 57, 1.0),
                      ),
                    ),
                    Text("Создайте новый аккаунт",
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
                //flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(),
                    TextField(),
                    TextField(),
                  ],
                ),
              ),
              Expanded(
                //flex: 1,
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: (){

                      },
                      child: Text('зарегистрироваться',
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
        //alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Text('Уже есть аккаунт?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            TextButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Login()));
            },
              child: Text('Войти',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0,21,170, 1),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}