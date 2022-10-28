import 'package:flutter/material.dart';
 
enum Answer { option1, option2}

class DichotomicQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final String? option1;
  final String? option2;


  const DichotomicQuestion(
    {super.key,
    required this.question,
    required this.questionID, 
    required this.option1, 
    required this.option2,
    });


  @override
  State<DichotomicQuestion> createState() => _DichotomicQuestionState();
}

class _DichotomicQuestionState extends State<DichotomicQuestion> {
  Answer? _answer = Answer.option1;

  void buttonpressed(){
    print(_answer);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.blueGrey, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child:  Column(
        children: <Widget>[
          Text(
            widget.question!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          ListTile(
            title: Text(widget.option1!),
            leading: Radio<Answer>(
              value: Answer.option1,
              groupValue: _answer,
              onChanged: (Answer? value) {
                setState(() {
                  _answer = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(widget.option2!),
            leading: Radio<Answer>(
              value: Answer.option2,
              groupValue: _answer,
              onChanged: (Answer? value) {
                setState(() {
                  _answer = value;
                });
              },
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              textStyle: const TextStyle(fontSize: 15),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(10.0),
            ),
            onPressed: buttonpressed,
            child: const Text('Submit'),
          ),
        ],
      )
    );
  }
}
