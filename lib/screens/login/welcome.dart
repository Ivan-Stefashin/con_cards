//import 'dart:collection';
//import 'dart:io';

import 'package:con_cards/screens/login/signUp.dart';
import 'package:flutter/material.dart';
import 'package:con_cards/screens/login/logIn.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Здравствуйте, давайте знакомиться!',
      //                     style: TextStyle(fontSize: 40)),
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.87,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  //color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset('assets/images/logo.png', width: 50, height: 50,),
                      ),
                      Text('ConCards',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500, //толщина линий
                            fontStyle: FontStyle.italic, //наклон
                            color: Color.fromRGBO(80, 80, 80, 1)
                          )
                      ),
                    ],
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                  child: Container(
                    //color: Colors.red,
                    child: Image.asset('assets/images/man_with_laptop.png',),
                  ),
                  flex: 5,
              ),
              Expanded(
                  child: Container(
                    //color: Colors.orange,
                    child: Center(
                      child:
                          Column(
                            children: [
                              Text('Приветствуем !',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                //fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(0, 10, 57, 1.0),
                              ),
                              ),
                              Text('Благодарим за доверие нам.'
                                  '\nConCards - удобное приложение для всех ваших банковских карт!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                    )
                  ),
                  flex: 2
              ),
              Expanded(
                flex: 2,
                  //child: Container(
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
                                              builder: (context) => Login()));
                                    },
                                    child: Text("войти",
                                       style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        )),
                                ),
                              ),
                            )
                        ),
                         Expanded(
                           child: Center(
                               child: SizedBox(
                                 width: double.infinity,
                                 child: OutlinedButton(
                                   onPressed: () {
                                     Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) => Signup()));
                                   },
                                   child: Text('зарегистрироваться',
                                   style: TextStyle(
                                     fontSize: 18,
                                     color: Color.fromRGBO(0,21,170, 1),
                                   ),
                                   ),
                                 ),
                               )
                           ),
                         ),
                      ],
                    ),
                  ),
              //),
            ],
          ),
        )
      )
    );
  }
}