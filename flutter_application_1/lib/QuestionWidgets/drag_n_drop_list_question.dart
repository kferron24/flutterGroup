import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

import '../Log/SAppBar.dart';
import '../Log/log_page.dart';
import '../QuestionClasses/question.dart';

class DragNDropListQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<String>? options;
  final int next;
  final List<Question>? listQuestions;

  const DragNDropListQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.options,
      required this.next,
      this.listQuestions});

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
        appBar: const CustomAppBar(),
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
                    // Expanded(
                    //     child: ListView(
                    //   padding: const EdgeInsets.all(8),
                    //   children: const <Widget>[
                    //     SizedBox(
                    //       height: 50,
                    //       child: Center(child: Text('Entry A')),
                    //     ),
                    //     SizedBox(
                    //       height: 50,
                    //       child: Center(child: Text('Entry B')),
                    //     ),
                    //     SizedBox(
                    //       height: 50,
                    //       child: Center(child: Text('Entry C')),
                    //     ),
                    //   ],
                    // )),
                    Expanded(
                        child: ReorderableListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                          final index = newIndex;
                          final option = options.removeAt(oldIndex);
                          options.insert(index, option);
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
                          switch (widget.next) {
                            case -1:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions!.last
                                            .createWidget(
                                                widget.listQuestions!)));
                              }
                              break;
                            case 0:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![
                                                widget.questionID + 1]
                                            .createWidget(
                                                widget.listQuestions!)));
                              }
                              break;
                            default:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![widget.next]
                                            .createWidget(
                                                widget.listQuestions!)));
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
                    const SizedBox(height: 50.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(255, 0, 0, 0),
                              width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35.0))), //
                      child: RawMaterialButton(
                        fillColor: const Color.fromRGBO(0, 53, 63, 1),
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        onPressed: () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LogPage()));
                        },
                        child: const Text("Log out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    )
                  ],
                ))));
  }
}
