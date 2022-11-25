import '../QuestionWidgets/text_question.dart';
import 'answer.dart';
import 'question.dart';
import 'package:flutter/material.dart';

class TextClass extends Question {
  int? _next;

  TextClass(String txt, int identifiant, int next) {
    text = txt;
    id = identifiant;
    _next = next;
  }

  //  DichotomicClass(this.text,this.id,this._options,this._next);

  factory TextClass.fromJson(dynamic json) {
    return TextClass(
        json['text'] as String, json['id'] as int, json['next'] as int);
  }

  @override
  StatefulWidget createWidget(List<Question> questions, List<Answer> answers) {
    return TextQuestion(
        question: text,
        questionID: id!,
        next: _next!,
        listQuestions: questions,
        listAnswers: answers);
  }

  @override
  String toString() {
    return '{ $text, $id, $_next }';
  }
}
