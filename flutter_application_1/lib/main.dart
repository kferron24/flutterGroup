import 'package:flutter/material.dart';

import 'Dichotomic.dart';
import 'MultipleChoiceQuestion.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MultipleChoiceQuestion(
            question:"Quels fruits aimez-vous?",
            questionID:1,
            possibleAnswers:['Banane',
              'Pomme',
              'Framboise',
              'Fraise',
              'Mangue',
              "Pamplemousse",
              "Orange",
              "Mandarine"]
          ),
        ),
      ),
    );
  }
}