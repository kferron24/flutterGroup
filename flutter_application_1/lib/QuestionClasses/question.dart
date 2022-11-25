import 'package:flutter/material.dart';

import 'answer.dart';


abstract class Question {
  String? text;
  int? id;

  StatefulWidget createWidget(List<Question> questions, List<Answer> answers);
}
