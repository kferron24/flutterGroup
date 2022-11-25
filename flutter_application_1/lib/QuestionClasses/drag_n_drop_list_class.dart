import 'package:flutter_application_1/QuestionWidgets/drag_n_drop_list_question.dart';

import '../QuestionWidgets/multiple_choice_question.dart';
import 'answer.dart';
import 'question.dart';
import 'package:flutter/material.dart';

class DragNDropListClass extends Question {
  List<String>? _options;
  int? _next;

  DragNDropListClass(
      String txt, int identifiant, List<String>? options, int next) {
    text = txt;
    id = identifiant;
    _options = options;
    _next = next;
  }

  //  DichotomicClass(this.text,this.id,this._options,this._next);

  factory DragNDropListClass.fromJson(dynamic json) {
    return DragNDropListClass(json['text'] as String, json['id'] as int,
        json['options'] as List<String>, json['next'] as int);
  }

  @override
  StatefulWidget createWidget(List<Question> questions, List<Answer> answers) {
    return DragNDropListQuestion(
        question: text,
        questionID: id!,
        options: _options!,
        next: _next!,
        listQuestions: questions,
        listAnswers: answers);
  }

  @override
  String toString() {
    return '{ $text, $id, $_options, $_next }';
  }
}
