import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

import '../QuestionClasses/DichotomicClass.dart';
import '../QuestionClasses/MultipleChoiceClass.dart';
import '../QuestionClasses/Question.dart';

Future<List<Question>> readJsonFile(String filePath) async {
  final String response = await rootBundle.loadString('assets/questions.json');
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
    }
  }
  return list;
}

class Questionnary extends StatefulWidget {
  const Questionnary({super.key});

  @override
  State<Questionnary> createState() => _QuestionnaryState();
}

class _QuestionnaryState extends State<Questionnary> {
  //Méthode initState
  final List<Question> questions = [];

  
  @override
  void initState(){
    super.initState();
    readJsonFile('assets/questions.json').then((value) =>  
      setState(() {
        questions.addAll(value);
    }));
  }


  //Méthode FutureBuilder
  //final Future<List<Question>> questions = readJsonFile('assets/questions.json');


  @override
  Widget build(BuildContext context) {
    //return FutureBuilder(future: readJsonFile('assets/questions.json'),builder: ((context, snapshot) => Column(children: questions.map((question) => question.createWidget()).toList())));
    return Column(children: questions.map((question) => question.createWidget()).toList());
  }
}