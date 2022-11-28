import 'package:flutter/material.dart';
import 'package:flutter_application_1/QuestionClasses/answer.dart';

import '../Log/log_page.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';

class DragNDropListQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<String>? options;
  final int next;
  final List<Question>? listQuestions;
  final List<Answer>? listAnswers;

  const DragNDropListQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.options,
      required this.next,
      this.listQuestions,
      this.listAnswers});

  @override
  State<DragNDropListQuestion> createState() => _DragNDropListQuestionState();
}

class _DragNDropListQuestionState extends State<DragNDropListQuestion> {
  List<String> options = [];
  final Color oddItemColor = const Color.fromARGB(150, 255, 255, 255);
  final Color evenItemColor = const Color.fromARGB(100, 255, 255, 255);

  @override
  void initState() {
    super.initState();
    options = widget.options!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                    Container(
                      height: 56*options.length.toDouble(),
                        child: ReorderableListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          key: Key('$index'),
                          title: Text(options[index]),
                          tileColor: index.isOdd ? oddItemColor : evenItemColor,
                        );
                      },
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final items = options.removeAt(oldIndex);
                          options.insert(newIndex, items);
                        });
                      },
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
                          List<Answer> tempListAnswers = widget.listAnswers!;
                          tempListAnswers
                              .add(Answer(options, widget.questionID));

                          switch (widget.next) {
                            case -1:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions!.last
                                            .createWidget(widget.listQuestions!,
                                                tempListAnswers)));
                              }
                              break;
                            case 0:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![
                                                widget.questionID + 1]
                                            .createWidget(widget.listQuestions!,
                                                tempListAnswers)));
                              }
                              break;
                            default:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![widget.next]
                                            .createWidget(widget.listQuestions!,
                                                tempListAnswers)));
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
                ))));
  }
}
