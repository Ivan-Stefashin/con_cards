import 'package:flutter/material.dart';
import 'package:con_cards/con_cards_app.dart';

// Services
import 'package:firebase_core/firebase_core.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() {
  initFirebase();
  runApp(const ConCardsApp());
}
