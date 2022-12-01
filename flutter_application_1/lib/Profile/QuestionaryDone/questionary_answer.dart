import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionaryAnswer {
  final String? index;
  final String? msg;

  QuestionaryAnswer(
    this.index,
    this.msg,
  );

  QuestionaryAnswer.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : index = snapshot["index"],
        msg = snapshot["msg"];
}
