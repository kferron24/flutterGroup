import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
