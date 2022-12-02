import 'package:flutter_application_1/QuestionClasses/answer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../Log/log_page.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';

class StarRatingQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<int> range;
  final int next;
  final List<Question>? listQuestions;
  final List<Answer>? listAnswers;

  const StarRatingQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.range,
      required this.next,
      this.listQuestions,
      this.listAnswers});

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
                      itemCount: widget.range[2],
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(0, 53, 63, 1),
                              width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
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
                              .add(Answer(rating, widget.questionID));
                          switch (widget.next) {
                            case -1:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions!.last
                                            .createWidget(widget.listQuestions!,
                                                widget.listAnswers!)));
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
                                                widget.listAnswers!)));
                              }
                              break;
                            default:
                              {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => widget
                                            .listQuestions![widget.next]
                                            .createWidget(widget.listQuestions!,
                                                widget.listAnswers!)));
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
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 13.0,
                      animation: true,
                      percent: widget.questionID / widget.listQuestions!.length,
                      center: Text(
                        "${100 * widget.questionID / widget.listQuestions!.length}%",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color.fromARGB(255, 0, 161, 172),
                    ),
                  ],
                )))));
  }
}
