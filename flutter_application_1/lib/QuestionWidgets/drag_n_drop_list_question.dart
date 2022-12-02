import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';

import '../Profile/QuestionaryDone/questionary_answer.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../components/percent_disk.dart';
import '../home_screen.dart';

class DragNDropListQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<String>? options;
  final int next;
  final List<Question>? listQuestions;
  final QuestionaryDone questionarydone;

  const DragNDropListQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.options,
      required this.next,
      required this.listQuestions,
      required this.questionarydone});

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
                        height: 56 * options.length.toDouble(),
                        child: ReorderableListView.builder(
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              key: Key('$index'),
                              title: Text(options[index]),
                              trailing: const Icon(Icons.drag_indicator),
                              tileColor:
                                  index.isOdd ? oddItemColor : evenItemColor,
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
                              widget.questionID.toString(),
                              widget.options.toString());

                          widget.questionarydone.answer.add(answered);
                          switch (widget.next) {
                            case -1:
                              {
                                // updateQuest(
                                //     context: context, answer: widget.options.toString());
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
                                                widget.questionID + 1]
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
                    const SizedBox(height: 40.0),
                    PercentDisk(
                        value:
                            widget.questionID / widget.listQuestions!.length),
                  ],
                ))));
  }
}
