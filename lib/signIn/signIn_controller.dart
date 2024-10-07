import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class SignIn {
  SignIn();

  bool CheckUser(Email, Password) {
    initFirebase();

    // final ref = FirebaseDatabase.instance.ref();
    // FirebaseFirestore.instance.collection('Users').get();

    return true;
  }
}
