// ignore: file_names
import 'package:flutter/material.dart';

import '../Log/appbar.dart';
import '../Log/log_page.dart';
import '../Log/profile_screen.dart';

enum Answer { rate1, rate2, rate3 }

Map<String, String> ranking = <String, String>{
  "1": "🌟",
  "2": "🌟🌟",
  "3": "🌟🌟🌟",
};

class RankedQuestion extends StatefulWidget {
  final String? question;
  final int questionID;
  final int? rate1;
  final int? rate2;
  final int? rate3;

  const RankedQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.rate1,
    required this.rate2,
    required this.rate3,
  });

  @override
  State<RankedQuestion> createState() => _RankedQuestion();
}

class _RankedQuestion extends State<RankedQuestion> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: const Text(
                    "Can you rank these items please",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 161, 172),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/nestle.png',
                        fit: BoxFit.cover,
                        width: 80,
                      ),
                      Image.asset(
                        'assets/chocapic.png',
                        fit: BoxFit.cover,
                        width: 80,
                      ),
                      Image.asset(
                        'assets/Kellogg.png',
                        fit: BoxFit.cover,
                        width: 80,
                      ),
                    ],
                  ),
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Nestle",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButtonExample(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Chocapic",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButtonExample(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Kellogg's",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButtonExample(),
                    ],
                  )
                ]),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 0, 213, 255),
                          width: 2),
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
                          builder: (context) => const ProfileScreen()));
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

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = ranking.keys.first;

  void buttonpressed() {}

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: int.tryParse(dropdownValue),
      elevation: 8,
      style: const TextStyle(color: Color.fromRGBO(212, 111, 77, 1)),
      underline: Container(
        height: 1,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value.toString();
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return ranking.values.map<Widget>((String item) {
          // This is the widget that will be shown when you select an item.
          // Here custom text style, alignment and layout size can be applied
          // to selected item string.
          return Container(
            alignment: Alignment.centerLeft,
            constraints: const BoxConstraints(minWidth: 100),
            child: Text(
              item,
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          );
        }).toList();
      },
      items: ranking.keys
          .map<DropdownMenuItem<int>>((String item) => DropdownMenuItem<int>(
                value: int.tryParse(item),
                child: Text(item),
              ))
          .toList(),
    );
  }
}
