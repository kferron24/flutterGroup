// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_answer.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';
import 'package:flutter_application_1/home_screen.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../components/percent_disk.dart';

class DichotomicQuestion extends StatefulWidget {
  final String? question;
  final int? questionID;
  final List<String>? options;
  final List<int>? next;
  final List<Question>? listQuestions;
  final QuestionaryDone questionarydone;

  const DichotomicQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.options,
    required this.next,
    required this.listQuestions,
    required this.questionarydone,
  });

  @override
  State<DichotomicQuestion> createState() => _DichotomicQuestionState();
}

class _DichotomicQuestionState extends State<DichotomicQuestion> {
  var answer = "";
  late int optionsIdx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      widget.question!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    ...widget.options!
                        .map((option) => [
                              RadioListTile<String>(
                                value: option,
                                groupValue: answer,
                                title: Text(option),
                                onChanged: (v) => setState(() {
                                  answer = v!;
                                  optionsIdx = widget.options!.indexOf(option);
                                }),
                              )
                            ])
                        .expand((w) => w)
                        .toList(),
                    const SizedBox(height: 22.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))), //
                      child: RawMaterialButton(
                        fillColor: Theme.of(context).secondaryHeaderColor,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        onPressed: () async {
                          QuestionaryAnswer answered = QuestionaryAnswer(
                              widget.questionID.toString(), answer);

                          widget.questionarydone.answer.add(answered);
                          switch (widget.next![optionsIdx]) {
                            case -1:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              }
                              break;
                            case 0:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![
                                                widget.questionID! + 1]
                                            .createWidget(widget.listQuestions!,
                                                widget.questionarydone)));
                              }
                              break;
                            default:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![
                                                widget.next![optionsIdx]]
                                            .createWidget(widget.listQuestions!,
                                                widget.questionarydone)));
                              }
                              break;
                          }
                        },
                        child: const Text("SUBMIT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    PercentDisk(
                        value:
                            widget.questionID! / widget.listQuestions!.length),
                  ],
                )))));
  }
}
