import 'package:flutter/material.dart';

import 'QuestionaryDone/questionary_done.dart';

class QuestionaryAnswered extends StatelessWidget {
  final List<QuestionaryDone> questionaryDone;

  const QuestionaryAnswered({
    super.key,
    required this.questionaryDone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Questionaries answers:",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...questionaryDone.map((questionary) => Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Questionary ${questionary.index}",
                        style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ...questionary.answer.map((ans) => Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                "Question ${ans.index}: ",
                                style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "${ans.msg}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ))
      ],
    );
  }
}
