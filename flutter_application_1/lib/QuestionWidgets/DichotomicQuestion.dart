import 'package:flutter/material.dart';

class DichotomicQuestion extends StatefulWidget {
  final String? question;
  final int? questionID;
  final List<String>? options;
  final List<int>? next;

  const DichotomicQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.options,
    required this.next,
  });

  @override
  State<DichotomicQuestion> createState() => _DichotomicQuestionState();
}

class _DichotomicQuestionState extends State<DichotomicQuestion> {
  var answer = "";

  void buttonpressed() {
    print(answer);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        child: Column(children: [
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
                      onChanged: (v) => setState(() => answer = v!),
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
            onPressed: buttonpressed,
            child: const Text('Submit'),
          )
        ]),
      )
    );
  }
}
