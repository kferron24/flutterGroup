import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Log/LogPage.dart';
import 'package:flutter_application_1/Log/ProfileScreen.dart';

class TextSlider extends StatefulWidget {
  const TextSlider({super.key});

  @override
  State<TextSlider> createState() => _TextSliderState();
}

class _TextSliderState extends State<TextSlider> {
  double _value = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  "Slider Question",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "How would you rate your",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "experience out of 10",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                Slider(
                  min: 0.0,
                  max: 100.0,
                  value: _value,
                  divisions: 10,
                  label: '${_value.round()}',
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 53, 63, 1), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))), //
                  child: RawMaterialButton(
                    fillColor: Color.fromRGBO(212, 111, 77, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LogPage()));
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
