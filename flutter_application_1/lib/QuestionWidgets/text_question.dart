import 'package:flutter/material.dart';
import 'package:flutter_application_1/Log/log_page.dart';
import '../Log/appbar.dart';
import 'choose_theme.dart';

class TextQuestion extends StatefulWidget {
  const TextQuestion({super.key});

  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  double _value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(type: 'Profile'),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Text Question",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "What is your name ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(0, 53, 63, 1), width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))), //
                  child: RawMaterialButton(
                    fillColor: const Color.fromRGBO(212, 111, 77, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ChooseTheme()));
                    },
                    child: const Text("SUBMIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                  ),
                ),
                const SizedBox(height: 50.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(255, 0, 0, 0), width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(35.0))), //
                  child: RawMaterialButton(
                    fillColor: const Color.fromRGBO(0, 53, 63, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LogPage()));
                    },
                    child: const Text("Log out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                  ),
                )
              ],
            ))));
  }
}
