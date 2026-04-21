import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA7n7-5u2rs_tntvWGqOnIgVgejC40QJjw",
      authDomain: "hiking-apps.firebaseapp.com",
      projectId: "hiking-apps",
      storageBucket: "hiking-apps.firebasestorage.app",
      messagingSenderId: "640156216613",
      appId: "1:640156216613:web:d5d2e3a74b6effb68cbecc",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
