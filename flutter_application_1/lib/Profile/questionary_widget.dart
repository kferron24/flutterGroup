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
        Row(
          children: [
            Expanded(
              flex: 5, // 60% of space => (6/(6 + 4))
              child: Text(
                "Questionaries answered:",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        ...questionaryDone.map((questionary) => Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(32),
                  child: Text(
                    "Questionary ${questionary.index}",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    ...questionary.answer.map((ans) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Question ${ans.index}: ",
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${ans.msg}",
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
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
