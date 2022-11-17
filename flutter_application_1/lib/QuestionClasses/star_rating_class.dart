import 'package:flutter_application_1/QuestionWidgets/star_rating_question.dart';

import '../QuestionWidgets/dichotomic_question.dart';
import 'question.dart';

import 'package:flutter/material.dart';

class StarRatingClass extends Question {
  List<int>? _range;// range : [min_rating,init_rating,max_rating]
  int? _next;

  StarRatingClass(String txt, int identifiant, List<int> range, int next) {
    text = txt;
    id = identifiant;
    _range = range;
    _next = next;
  }

  //  StarRatingClass(this.text,this.id,this._options,this._next);

  factory StarRatingClass.fromJson(dynamic json) {
    return StarRatingClass(json['text'] as String, json['id'] as int,
        json['range'] as List<int>, json['next'] as int);
  }

  @override
  StatefulWidget createWidget(List<Question> questions) {
    return StarRatingQuestion(
        question: text,
        questionID: id!,
        range: _range!,
        next: _next!,
        listQuestions: questions);
  }

  @override
  String toString() {
    return '{ $text, $id, $_range, $_next }';
  }
}
