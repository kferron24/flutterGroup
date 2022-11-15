import '../QuestionWidgets/dichotomic_question.dart';
import 'Question.dart';
import 'package:flutter/material.dart';

class DichotomicClass extends Question {
  List<String>? _options;
  List<int>? _next;

  DichotomicClass(
      String txt, int identifiant, List<String> options, List<int> next) {
    text = txt;
    id = identifiant;
    _options = options;
    _next = next;
  }

  //  DichotomicClass(this.text,this.id,this._options,this._next);

  factory DichotomicClass.fromJson(dynamic json) {
    return DichotomicClass(json['text'] as String, json['id'] as int,
        json['options'] as List<String>, json['next'] as List<int>);
  }

  @override
  StatefulWidget createWidget() {
    return DichotomicQuestion(
        question: text, questionID: id!, options: _options!, next: _next!);
  }

  @override
  String toString() {
    return '{ $text, $id, $_options, $_next }';
  }
}
