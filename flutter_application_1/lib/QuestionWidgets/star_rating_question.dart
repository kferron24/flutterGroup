import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_answer.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_done.dart';
import 'package:flutter_application_1/components/percent_disk.dart';
import 'package:flutter_application_1/firebase/firestore_profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../QuestionClasses/question.dart';
import '../components/appbar.dart';
import '../home_screen.dart';

class StarRatingQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<int> range;
  final int next;
  final List<Question>? listQuestions;
  final QuestionaryDone questionarydone;

  const StarRatingQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.range,
      required this.next,
      this.listQuestions,
      required this.questionarydone});

  @override
  State<StarRatingQuestion> createState() => _StarRatingQuestionState();
}

class _StarRatingQuestionState extends State<StarRatingQuestion> {
  late int rating;

  @override
  void initState() {
    super.initState();
    rating = widget.range[1];
  }

  @override
  Widget build(BuildContext context) {
    // final questionaryDone = QuestionaryDone(index: "3", answer: [
    //   QuestionaryAnswer("1", "Je m'appelle Alex"),
    //   QuestionaryAnswer("2", "Bonjour Alex")
    // ]);
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
                    RatingBar.builder(
                      initialRating: widget.range[1].toDouble(),
                      minRating: widget.range[0].toDouble(),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glowColor: Theme.of(context).primaryColorLight,
                      glow: false,
                      itemCount: widget.range[2],
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
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
                              widget.questionID.toString(), rating.toString());

                          widget.questionarydone.answer.add(answered);
                          switch (widget.next) {
                            case -1:
                              {
                                await setQuestionaryDone(
                                    questionaryDone: widget.questionarydone);
                                // ignore: use_build_context_synchronously
                                // updateQuest(
                                //     context: context, answer: tempListAnswers);
                                // ignore: use_build_context_synchronously
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
                    PercentDisk(value: widget.questionID / widget.listQuestions!.length)
                  ],
                )))));
  }
}
