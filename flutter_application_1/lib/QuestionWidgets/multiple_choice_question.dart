import 'package:flutter/material.dart';

import '../components/appbar.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<String> options;
  final int next;

  const MultipleChoiceQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.options,
    required this.next,
  });

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> mapAnswers = {
      for (var item in widget.options) item: true
    };
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
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
                  children: mapAnswers.keys
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
        ])));
  }
}
