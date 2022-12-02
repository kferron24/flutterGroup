import 'package:flutter/material.dart';
import 'package:flutter_application_1/Log/log_page.dart';
import 'package:flutter_application_1/QuestionClasses/answer.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TextQuestion extends StatefulWidget {
  final String? question;
  final int? questionID;
  final int? next;
  final List<Question>? listQuestions;
  final List<Answer>? listAnswers;

  const TextQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.next,
    required this.listQuestions,
    this.listAnswers,
  });

  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  String _answer = '';

  void _updateText(val) {
    setState(() {
      _answer = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.question!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                TextFormField(
                  onChanged: (val) {
                    _updateText(val);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your answer",
                  ),
                ),
                // Text(_answer),
                const SizedBox(height: 12.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(0, 53, 63, 1), width: 2),
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
                      List<Answer> tempListAnswers = widget.listAnswers!;
                      tempListAnswers.add(Answer(_answer, widget.questionID!));

                      switch (widget.next) {
                        case -1:
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        widget.listQuestions!.last.createWidget(
                                            widget.listQuestions!,
                                            widget.listAnswers!)));
                          }
                          break;
                        case 0:
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => widget
                                        .listQuestions![widget.questionID! + 1]
                                        .createWidget(widget.listQuestions!,
                                            widget.listAnswers!)));
                          }
                          break;
                        default:
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => widget
                                        .listQuestions![widget.next!]
                                        .createWidget(widget.listQuestions!,
                                            widget.listAnswers!)));
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
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.4,
                  center: const Text(
                    "40.0%",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color.fromARGB(255, 0, 161, 172),
                ),
              ],
            ))));
  }
}
