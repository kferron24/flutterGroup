import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';
import 'package:flutter_application_1/QuestionClasses/answer.dart';
import 'package:flutter_application_1/QuestionClasses/drag_n_drop_list_class.dart';
import 'package:flutter_application_1/QuestionClasses/star_rating_class.dart';

import '../QuestionClasses/dichotomic_class.dart';
import '../QuestionClasses/multiple_choice_class.dart';
import '../QuestionClasses/question.dart';
import '../QuestionClasses/slider_class.dart';
import '../QuestionClasses/text_class.dart';

Future<List<Question>> readJsonFile(List<dynamic> questionary) async {
  List<Question> list = [];

  for (var question in questionary) {
    switch (question['type']) {
      case "DICHOTOMIC":
        {
          List<String> options = [];
          for (String option in question['options']) {
            options.add(option);
          }
          List<int> nexts = [];
          for (int next in question['next']) {
            nexts.add(next);
          }
          var dicho =
              DichotomicClass(question['text'], question['id'], options, nexts);
          list.add(dicho);
        }
        break;
      case "TEXT":
        {
          int next = question['next'];
          var dicho = TextClass(question['text'], question['id'], next);
          list.add(dicho);
        }
        break;
      case "MULTIPLECHOICE":
        {
          List<String> options = [];
          for (String option in question['options']) {
            options.add(option);
          }
          var multip = MultipleChoiceClass(
              question['text'], question['id'], options, question['next']);
          list.add(multip);
        }
        break;
      case "STAR_RATING":
        {
          List<int> range = [];
          for (int option in question['range']) {
            range.add(option);
          }
          int next = question['next'];
          var dicho =
              StarRatingClass(question['text'], question['id'], range, next);
          list.add(dicho);
        }
        break;
      case "DRAG_N_DROP_LIST":
        {
          List<String> options = [];
          for (String option in question['options']) {
            options.add(option);
          }
          var multip = DragNDropListClass(
              question['text'], question['id'], options, question['next']);
          list.add(multip);
        }
        break;
      case "TEXT_SLIDER":
        {
          List<double> range = [];
          for (int option in question['range']) {
            range.add(option.toDouble());
          }
          int next = question['next'];
          var slider =
              TextSliderClass(question['text'], question['id'], range, next);
          list.add(slider);
        }
        break;
    }
  }
  return list;
}

class Questionary extends StatefulWidget {
  final List<dynamic> json;
  const Questionary({super.key, required this.json});

  @override
  State<Questionary> createState() => _QuestionaryState();
}

class _QuestionaryState extends State<Questionary> {
  //M??thode initState
  final List<Question> questions = [];
  final List<Answer> answers = [];

  QuestionaryDone questionaryDone = QuestionaryDone(index: '1', answer: []);

  @override
  void initState() {
    super.initState();
    readJsonFile(widget.json).then((value) => setState(() {
          questions.addAll(value);
        }));
  }

  //M??thode FutureBuilder
  //final Future<List<Question>> questions = readJsonFile('assets/questions.json');

  @override
  Widget build(BuildContext context) {
    QuestionaryDone questionarydone =
        QuestionaryDone(id: '0', index: '1', answer: []);
    //return FutureBuilder(future: readJsonFile('assets/questions.json'),builder: ((context, snapshot) =>  questions[0].createWidget(questions)));
    return questions.isEmpty
        ? const Text("Loading questionary...")
        : questions[0].createWidget(questions, questionarydone);
  }
}
