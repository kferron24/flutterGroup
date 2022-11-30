import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';

import '../Log/firebase_log.dart';
import '../Log/log_page.dart';
import '../Profile/QuestionaryDone/questionary_answer.dart';
import '../QuestionClasses/answer.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';
import '../home_screen.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<String> options;
  final int next;
  final List<Question>? listQuestions;
  final QuestionaryDone questionarydone;

  const MultipleChoiceQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.options,
    required this.next,
    this.listQuestions,
    required this.questionarydone,
  });

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  Map<String, bool> mapAnswers = {};

  @override
  void initState() {
    super.initState();
    mapAnswers = {for (var item in widget.options) item: false};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.question!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: widget.options
                              .map((answer) => CheckboxListTile(
                                    title: Text(answer),
                                    value: mapAnswers[answer],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        mapAnswers[answer] = value!;
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                      )),
                  const SizedBox(height: 22.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(0, 53, 63, 1),
                            width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))), //
                    child: RawMaterialButton(
                      fillColor: const Color.fromRGBO(212, 111, 77, 1),
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      onPressed: () async {
                        QuestionaryAnswer answered = QuestionaryAnswer(
                            widget.questionID.toString(),
                            mapAnswers.toString());

                        widget.questionarydone.answer.add(answered);

                        switch (widget.next) {
                          case -1:
                            {
                              // updateQuest(
                              //     context: context, answer: widget.questionarydone);
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
                                          .listQuestions![widget.questionID + 1]
                                          .createWidget(widget.listQuestions!,
                                              widget.questionarydone)));
                            }
                            break;
                          default:
                            {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => widget
                                          .listQuestions![widget.next]
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
                ]))));
  }
}
