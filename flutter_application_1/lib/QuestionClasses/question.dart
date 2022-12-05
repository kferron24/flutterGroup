import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';

abstract class Question {
  String? text;
  int? id;

  StatefulWidget createWidget(
      List<Question> questions, QuestionaryDone questionaryDone);
}
