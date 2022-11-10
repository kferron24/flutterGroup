import 'package:flutter/material.dart';
import '../Log/LogPage.dart';
import '../Log/ProfileScreen.dart';
import 'TextQuestion.dart';

import '../HomePage.dart';
import 'TextSlider.dart';

class ImageQuestion extends StatefulWidget {
  const ImageQuestion({super.key});

  @override
  State<ImageQuestion> createState() => _ImageQuestionState();
}

class _ImageQuestionState extends State<ImageQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                'QUIZZ',
                style: TextStyle(color: Color.fromRGBO(67, 12, 5, 1)),
              ),
              const SizedBox(
                width: 215,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 0, 0, 0), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(35.0))), //
                child: RawMaterialButton(
                  fillColor: Color.fromRGBO(0, 53, 63, 1),
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  child: const Text("Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                ),
              )
            ],
          ),
          backgroundColor: Color.fromRGBO(212, 111, 77, 1),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Image Question",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "Select your favourite car",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {}, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: Ink.image(
                          fit: BoxFit.cover, // Fixes border issues
                          width: 150,
                          height: 100,
                          image: const AssetImage(
                            'assets/fiat.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const TextSlider()));
                        }, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: Ink.image(
                          fit: BoxFit.cover, // Fixes border issues
                          width: 150,
                          height: 80,
                          image: const AssetImage(
                            'assets/bugatti.png',
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 22.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {}, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: Ink.image(
                          fit: BoxFit.cover, // Fixes border issues
                          width: 150,
                          height: 80,
                          image: const AssetImage(
                            'assets/amg.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {}, // Image tapped
                        splashColor: Colors.white10, // Splash color over image
                        child: Ink.image(
                          fit: BoxFit.cover, // Fixes border issues
                          width: 200,
                          height: 100,
                          image: const AssetImage(
                            'assets/urus.png',
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 50.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(255, 0, 0, 0), width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(35.0))), //
                  child: RawMaterialButton(
                    fillColor: Color.fromRGBO(0, 53, 63, 1),
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
