import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../QuestionClasses/answer.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
Future<String> loginUsingEmailPassword(
    {required String email,
    required String password,
    required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-email':
        return "L'email n'est pas valide.";
      case 'user-not-found':
        return "Cet utilisateur n'existe pas.";
      case 'wrong-password':
        return "Le mot de passe n'est pas bon.";
      default:
        return "Une erreur s'est produite.";
    }
  }

  return "";
}

Future<String> currentlyIn() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final User fuser = auth.currentUser!;
  final uid = fuser.uid;
  return uid;
}

Future<Map<String, List<String>>?> getQuest(List<Answer> answer) async {
  String date = dateFormat.format(DateTime.now());
  Map<String, dynamic> logquest = {"time": date, "answer": answer};
  return logquest;
}

Future<void> updateQuest(
    {required BuildContext context, required List<Answer> answer}) async {
  //var collection = FirebaseFirestore.instance.collection('collection');

  FirebaseFirestore.instance
      .collection('users')
      .doc(await currentlyIn())
      .set({"questionaryDone": await currentlyIn()});

  return;
}

Future<void> userSetup(
    {required String email,
    required String password,
    required BuildContext context}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users
      .doc(uid)
      .set({'email': email, 'password': password, 'questionaryDone': []});
  // users
  //     .doc(uid)
  //     .collection("questionaryDone")
  //     .doc()
  //     .set({'answer': [], 'index': ""});

  return;
}

Future<String> registerUsingEmailPassword(
    {required String email,
    required String password,
    required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "Cet email est déjà pris.";
      case 'invalid-email':
        return "L'email n'est pas valide.";
      case 'unknown':
        return "Remplissez chacun des formulaires.";
      case 'weak-password':
        return "Le mot de passe doit faire au moins 6 caractères";
      default:
        return "Une erreur s'est produite.";
    }
  }

  return "";
}
