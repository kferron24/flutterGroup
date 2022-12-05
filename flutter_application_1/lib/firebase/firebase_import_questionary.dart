import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Profile/QuestionaryDone/questionary_class.dart';

Future setQuestionary(Map<String,dynamic> json) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference questionaryDoneRef =
      users.doc(uid).collection("questionaryDone").doc();
  String questionaryId = questionaryDoneRef.id;
  await FirebaseFirestore.instance
      .collection('questionaries')
      .doc().set({'json':json});
}

Future<List<QuestionaryClass>> getQuestionaries() async {
  print("getQuestionary entrée");
  final QuerySnapshot<Map<String, dynamic>> questionariesQuery =
      await FirebaseFirestore.instance
          .collection('questionaries')
          .get();
  print("questionariesQuery : $questionariesQuery");
  final questionaries = questionariesQuery.docs
      .map((doc) => QuestionaryClass.fromSnapshot(doc))
      .toList();
  print("questionaries : $questionaries");
  return questionaries;
}