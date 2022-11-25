import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

import '../Log/log_page.dart';
import '../QuestionClasses/question.dart';
import '../components/appbar.dart';

class StarRatingQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final List<int> range;
  final int next;
  final List<Question>? listQuestions;

  const StarRatingQuestion(
      {super.key,
      this.question,
      required this.questionID,
      required this.range,
      required this.next,
      this.listQuestions});

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
                )))));
  }
}
