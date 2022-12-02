import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/QuestionClasses/answer.dart';
import 'package:flutter_application_1/QuestionClasses/drag_n_drop_list_class.dart';
import 'package:flutter_application_1/QuestionClasses/slider_class.dart';
import 'package:flutter_application_1/QuestionClasses/star_rating_class.dart';

import '../QuestionClasses/dichotomic_class.dart';
import '../QuestionClasses/multiple_choice_class.dart';
import '../QuestionClasses/question.dart';
import '../QuestionClasses/text_class.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';

Future<List<Question>> readJsonFile(String filePath) async {
  final String response = await rootBundle.loadString('assets/questions4.json');
  final data = json.decode(response);

  var questionsList = data['questions'];
  List<Question> list = [];
  for (var question in questionsList) {
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
          var star =
              StarRatingClass(question['text'], question['id'], range, next);
          list.add(star);
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

class Questionary4 extends StatefulWidget {
  const Questionary4({super.key});

  @override
  State<Questionary4> createState() => _Questionary4State();
}

class _Questionary4State extends State<Questionary4> {
  //Méthode initState
  final List<Question> questions = [];
  final List<Answer> answers = [];

  QuestionaryDone finalAnswers = QuestionaryDone(index: '4', answer: []);

  @override
  void initState() {
    super.initState();
    readJsonFile('assets/questions4.json').then((value) => setState(() {
          questions.addAll(value);
        }));
  }

  //Méthode FutureBuilder
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
