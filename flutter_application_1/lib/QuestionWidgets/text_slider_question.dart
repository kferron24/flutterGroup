import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';
import '../Log/log_page.dart';
import '../Profile/QuestionaryDone/questionary_answer.dart';
import '../QuestionClasses/answer.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';
import '../components/percent_disk.dart';
import '../end_of_quizz.dart';

class TextSliderQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<double> range;
  final int next;
  final List<Question>? listQuestions;
  final QuestionaryDone questionarydone;

  const TextSliderQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.range,
      required this.next,
      this.listQuestions,
      required this.questionarydone});

  @override
  State<TextSliderQuestion> createState() => _TextSliderQuestionState();
}

class _TextSliderQuestionState extends State<TextSliderQuestion> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.range[1];
  }

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
                    const SizedBox(height: 28.0),
                    Slider(
                      min: widget.range[0],
                      max: widget.range[3],
                      value: _value,
                      divisions: widget.range[2].toInt(),
                      label: '${_value.round()}',
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const SizedBox(height: 22.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(0, 53, 63, 1),
                              width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      child: RawMaterialButton(
                        fillColor: Theme.of(context).secondaryHeaderColor,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        onPressed: () async {
                          QuestionaryAnswer answered = QuestionaryAnswer(
                              widget.questionID.toString(), _value.toString());

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
                )))));
  }
}
