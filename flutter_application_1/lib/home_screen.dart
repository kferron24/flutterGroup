import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/QuestionaryDone/questionary_class.dart';
import 'package:flutter_application_1/firebase/firebase_import_questionary.dart';
import 'QuestionWidgets/questionary.dart';
import 'storage/storage.dart';

import 'components/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QuestionaryClass> listQuestionaries = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final List<QuestionaryClass> questionaries = await getQuestionaries();
    print("PAPA ${questionaries.toString}");
    setState(() {
      listQuestionaries = questionaries;
    });
    print(listQuestionaries);
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Choose a Quizz",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                ...listQuestionaries
                    .map((questionary) => [
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Questionary(json: questionary.json['questions'])))
                            },
                            child: Card(
                              color: Theme.of(context).primaryColorDark,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), //<-- SEE HERE
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      questionary.json['image_url'].toString(),
                                      height: 180,
                                      width: 300,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      questionary.json['questionary_name']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        ])
                    .expand((w) => w)
                    .toList(),
                const SizedBox(height: 30.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(255, 0, 0, 0), width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(35.0))), //
                  child: RawMaterialButton(
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () => importJson(),
                    child: const Text(
                      "Import a questionary",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ))));
  }
}

importJson() async {
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.any, allowMultiple: false);

  if (result != null) {
    File file = File(result.files.single.path!);
    String str = file.readAsStringSync();
    final data = json.decode(str);
    setQuestionary(data);
  } else {
    // User canceled the picker
  }
}
