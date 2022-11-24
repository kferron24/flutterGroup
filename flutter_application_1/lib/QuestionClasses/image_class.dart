import '../QuestionWidgets/image_question.dart';
import 'question.dart';
import 'package:flutter/material.dart';
import 'question.dart';

class ImageClass extends Question {
  List<String>? _options;
  List<int>? _next;

  ImageClass(
      String txt, int identifiant, List<String> options, List<int> next) {
    text = txt;
    id = identifiant;
    _options = options;
    _next = next;
  }

  //  DichotomicClass(this.text,this.id,this._options,this._next);

  factory ImageClass.fromJson(dynamic json) {
    return ImageClass(json['text'] as String, json['id'] as int,
        json['options'] as List<String>, json['next'] as List<int>);
  }

  @override
  StatefulWidget createWidget(List<Question> questions) {
    return ImageQuestion(
        question: text,
        questionID: id!,
        options: _options!,
        next: _next!,
        listQuestions: questions);
  }

  @override
  String toString() {
    return '{ $text, $id, $_options, $_next }';
  }
}
