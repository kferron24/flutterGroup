import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionaryClass{
  final String? id;
  final Map<String,dynamic> json;

  QuestionaryClass({this.id, required this.json});

  QuestionaryClass.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        json=snapshot["json"];
}
