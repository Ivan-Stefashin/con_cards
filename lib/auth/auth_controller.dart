import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Authentication {
  Authentication();

  void Auth(FirstName, LastName, Patronymic, Email, Password) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseFirestore.instance.collection('Users').add({
      'FirstName': FirstName,
      'LastName': LastName,
      'Patronymic': Patronymic,
      'Email': Email,
      'Password': Password,
      'RegistrationDate': DateTime.now(),
    });
  }
}
