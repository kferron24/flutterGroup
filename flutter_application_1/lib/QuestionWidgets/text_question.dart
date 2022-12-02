import 'package:flutter/material.dart';
import 'package:flutter_application_1/Log/log_page.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';
import 'package:flutter_application_1/QuestionClasses/answer.dart';
import '../Profile/QuestionaryDone/questionary_answer.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';

class TextQuestion extends StatefulWidget {
  final String? question;
  final int? questionID;
  final int? next;
  final List<Question>? listQuestions;
  final QuestionaryDone questionarydone;

  const TextQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.next,
    required this.listQuestions,
    required this.questionarydone,
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
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.question!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
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
                              widget.questionID.toString(), _answer);

                          widget.questionarydone.answer.add(answered);

                          switch (widget.next) {
                            case -1:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions!.last
                                            .createWidget(widget.listQuestions!,
                                                widget.questionarydone)));
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
                                            .listQuestions![widget.next!]
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
                  ],
                )))));
  }
}
