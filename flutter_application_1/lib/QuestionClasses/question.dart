import 'package:flutter/material.dart';

abstract class Question {
  String? text;
  int? id;

  StatefulWidget createWidget(List<Question> questions);
}
