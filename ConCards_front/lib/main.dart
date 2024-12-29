import 'package:flutter/material.dart';
import 'package:con_cards/con_cards_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Services
import 'package:firebase_core/firebase_core.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

Future<void> initSupaBase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://umbevbgbgtklpzgduldk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVtYmV2YmdiZ3RrbHB6Z2R1bGRrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA2NTc0NDksImV4cCI6MjA0NjIzMzQ0OX0.QOzgOLoZHqMUNpw5Fk2e22WofIfghoJIDn8qcaUjRFE',
  );
}

void main() {
  initFirebase();
  initSupaBase();
  runApp(const ConCardsApp());
}
