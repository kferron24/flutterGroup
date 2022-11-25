import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_answer.dart';

class QuestionaryDone {
  final String id;
  final String index;
  List<QuestionaryAnswer> answer;

  QuestionaryDone(
      {required this.id, required this.index, required this.answer});

  QuestionaryDone.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        index = snapshot["index"]!,
        answer = [];
}
