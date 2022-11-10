import '../QuestionWidgets/MultipleChoiceQuestion.dart';
import 'Question.dart';
import 'package:flutter/material.dart';

class MultipleChoiceClass extends Question {
  List<String>? _options;
  int? _next;

  MultipleChoiceClass(String txt, int identifiant, List<String>? options, int next) {
    text=txt;
    id=identifiant;
    _options = options;
    _next = next;
  }

  //  DichotomicClass(this.text,this.id,this._options,this._next);

  
  factory MultipleChoiceClass.fromJson(dynamic json) {
    return MultipleChoiceClass(json['text'] as String, json['id'] as int, json['options'] as List<String>, json['next'] as int );
  }

  @override
  StatefulWidget createWidget() {
    return MultipleChoiceQuestion(
        question: text, questionID: id!, options: _options!, next: _next!);
  }

  @override
  String toString() {
    return '{ $text, $id, $_options, $_next }';
  }
}