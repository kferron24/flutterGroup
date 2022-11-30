import 'package:flutter_application_1/QuestionWidgets/text_slider_question.dart';
import 'answer.dart';
import 'question.dart';

import 'package:flutter/material.dart';

class TextSliderClass extends Question {
  List<double>? _range; // range : [min_rating,init_rating,divisions,max_rating]
  int? _next;

  TextSliderClass(String txt, int identifiant, List<double> range, int next) {
    text = txt;
    id = identifiant;
    _range = range;
    _next = next;
  }

  factory TextSliderClass.fromJson(dynamic json) {
    return TextSliderClass(json['text'] as String, json['id'] as int,
        json['range'] as List<double>, json['next'] as int);
  }

  @override
  StatefulWidget createWidget(List<Question> questions, List<Answer> answers) {
    return TextSliderQuestion(
        question: text,
        questionID: id!,
        range: _range!,
        next: _next!,
        listQuestions: questions,
        listAnswers: answers);
  }

  @override
  String toString() {
    return '{ $text, $id, $_range, $_next }';
  }
}
