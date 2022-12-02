import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'storage/storage.dart';

import 'package:flutter_application_1/QuestionWidgets/questionary.dart';
import 'package:flutter_application_1/QuestionWidgets/questionary2.dart';
import 'package:flutter_application_1/QuestionWidgets/questionary3.dart';
import 'package:flutter_application_1/QuestionWidgets/questionary4.dart';
import 'components/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
        appBar: const CustomAppBar(type: 'Profile'),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Choose a Quizz",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Questionary()));
                        }, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: FutureBuilder(
                            future: storage.downloadURL('movie.jpg'),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return Container(
                                    width: 150,
                                    height: 100,
                                    child: Image.network(
                                      snapshot.data!,
                                      fit: BoxFit.cover,
                                    ));
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              return Container();
                            }),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Questionary2()));
                        }, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: FutureBuilder(
                            future: storage.downloadURL('cars.jpg'),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return Container(
                                    width: 150,
                                    height: 100,
                                    child: Image.network(
                                      snapshot.data!,
                                      fit: BoxFit.cover,
                                    ));
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              return Container();
                            }),
                      ),
                    ]),
                const SizedBox(height: 15.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Questionary3()));
                        }, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: FutureBuilder(
                            future: storage.downloadURL('sport.jpg'),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return Container(
                                    width: 150,
                                    height: 100,
                                    child: Image.network(
                                      snapshot.data!,
                                      fit: BoxFit.cover,
                                    ));
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              return Container();
                            }),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Questionary4()));
                        }, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: FutureBuilder(
                            future: storage.downloadURL('videogame.jpg'),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return Container(
                                    width: 150,
                                    height: 100,
                                    child: Image.network(
                                      snapshot.data!,
                                      fit: BoxFit.cover,
                                    ));
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              return Container();
                            }),
                      ),
                    ]),
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
                    onPressed:()=> importJson(),
                    child: const Text("Import a questionary",
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

importJson() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type:FileType.any,allowMultiple: false);

  if (result != null) {
    File file = File(result.files.single.path!);
    String str = file.readAsStringSync();
    print(str);
  } else {
    // User canceled the picker
  }
}
