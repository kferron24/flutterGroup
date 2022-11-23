import 'package:flutter/material.dart';

class LogWelcome extends StatelessWidget {
  const LogWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Text(
        "WELCOME TO QUIZZ",
        style: TextStyle(
          color: Color.fromARGB(255, 0, 161, 172),
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        "Login to the app",
        style: TextStyle(
          color: Color.fromRGBO(0, 53, 63, 1),
          fontSize: 38.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ]);
  }
}
