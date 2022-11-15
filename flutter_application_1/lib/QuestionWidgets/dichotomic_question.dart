import 'package:flutter/material.dart';

import '../QuestionClasses/question.dart';

class DichotomicQuestion extends StatefulWidget {
  final String? question;
  final int? questionID;
  final List<String>? options;
  final List<int>? next;
  final List<Question>? listQuestions;

  const DichotomicQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.options,
    required this.next,
    required this.listQuestions,
  });

  @override
  State<DichotomicQuestion> createState() => _DichotomicQuestionState();
}

class _DichotomicQuestionState extends State<DichotomicQuestion> {
  var answer = "";
  late int optionsIdx;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.question!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
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
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                textStyle: const TextStyle(fontSize: 15),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(10.0),
              ),
              onPressed: () async {
                switch(widget.next![optionsIdx]){
                  case -1:{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget.listQuestions!.last.createWidget(widget.listQuestions!)));
                  }break;
                  case 0:{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget.listQuestions![widget.questionID!+1].createWidget(widget.listQuestions!)));
                  }break;
                  default:{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget.listQuestions![widget.next![optionsIdx]].createWidget(widget.listQuestions!)));
                  }break;
                }
              },
              child: const Text('Submit'),
            ),
          ]),
    ));
  }
}
