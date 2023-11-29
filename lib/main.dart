import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Landing_Screen/Landing_Screen.dart';
import 'Login_Page/Login_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD59z1SJ774Hxbhpniz1Yc-wRw3OSueuOg",
        authDomain: "kp-enterpries.firebaseapp.com",
        projectId: "kp-enterpries",
        storageBucket: "kp-enterpries.appspot.com",
        messagingSenderId: "1071854083954",
        appId: "1:1071854083954:web:fbd962aefb36390ae1c7eb",
        measurementId: "G-P9ST7QJQFT"
    )
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home:LandinG_Screen()
    );
  }
}
