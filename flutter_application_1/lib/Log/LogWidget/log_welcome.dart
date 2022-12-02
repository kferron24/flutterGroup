import 'package:flutter/material.dart';

class LogWelcome extends StatelessWidget {
  const LogWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Login to the app",
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontSize: 38.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
    ]);
  }
}
