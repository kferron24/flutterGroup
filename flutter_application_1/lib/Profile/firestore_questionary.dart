import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'QuestionaryDone/questionary_answer.dart';
import 'QuestionaryDone/questionary_done.dart';

Future<List<QuestionaryDone>> getQuestionaryDone() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  final QuerySnapshot<Map<String, dynamic>> questionsQuery =
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection("questionaryDone")
          .get();
  final questions = questionsQuery.docs
      .map((doc) => QuestionaryDone.fromSnapshot(doc))
      .toList();

  for (QuestionaryDone question in questions) {
    final QuerySnapshot<Map<String, dynamic>> answersQuery =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection("questionaryDone")
            .doc(question.id)
            .collection("answer")
            .orderBy("index")
            .get();
    final answers = answersQuery.docs
        .map((doc) => QuestionaryAnswer.fromSnapshot(doc))
        .toList();

    question.answer = answers;
  }

  return questions;
}

Future getuserMail() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  final DocumentSnapshot<Map<String, dynamic>> data =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  final userMail = data.get("email");
  return userMail;
}
