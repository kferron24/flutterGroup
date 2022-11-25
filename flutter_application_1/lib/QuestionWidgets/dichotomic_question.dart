import 'package:flutter/material.dart';
import '../QuestionClasses/question.dart';
import '../Log/log_page.dart';
import '../components/appbar.dart';

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
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
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
                          switch (widget.next![optionsIdx]) {
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
                                                widget.questionID! + 1]
                                            .createWidget(
                                                widget.listQuestions!)));
                              }
                              break;
                            default:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![
                                                widget.next![optionsIdx]]
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
                  ],
                )))));
  }
}
