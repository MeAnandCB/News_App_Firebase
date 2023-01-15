import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_with_otp/view/spalsh.dart';

import 'Screens/LogInPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplash = true;
  LoadHome() {
    // ignore: prefer_const_constructors
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showingSplash = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: showingSplash ? SplashScreen() : MyPhone(),
    );
  }
}
