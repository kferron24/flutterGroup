import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Profile/questionary_widget.dart';
import 'package:flutter_application_1/components/title_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/appbar.dart';
import 'QuestionaryDone/questionary_answer.dart';
import 'QuestionaryDone/questionary_done.dart';
import 'firestore_questionary.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userMail = "";
  List<QuestionaryDone> questionaryDone = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final mail = await getuserMail();
    final questionaryDon = await getQuestionaryDone();
    setState(() {
      userMail = mail;
      questionaryDone = questionaryDon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
            margin: const EdgeInsets.all(32),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const TitleText(title: "Profile Screen"),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Expanded(
                            flex: 5, // 60% of space => (6/(6 + 4))
                            child: Text(
                              "Email:",
                              style: TextStyle(
                                color: Color.fromRGBO(67, 12, 5, 1),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 10, // 40% of space
                              child: Text(
                                userMail,
                                style: const TextStyle(
                                  color: Color.fromRGBO(212, 111, 77, 1),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ]),
                  ),
                  (questionaryDone.isEmpty)
                      ? const Text(
                          "Vous n'avez pas répondu à un seul questionnaire")
                      : QuestionaryAnswered(questionaryDone: questionaryDone)
                ]))));
  }
}
