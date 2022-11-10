import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(scaffoldBackgroundColor:const Color.fromRGBO(255, 191, 102, 1)),
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
