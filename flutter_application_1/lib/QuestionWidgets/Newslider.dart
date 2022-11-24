import 'package:flutter/material.dart';
import '../Log/appbar.dart';
import '../Log/log_page.dart';
import '../Log/profile_screen.dart';

class TextSlider extends StatefulWidget {
  const TextSlider({super.key});

  @override
  State<TextSlider> createState() => _TextSliderState();
}

class _TextSliderState extends State<TextSlider> {
  double _value = 10;
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

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
                  "We wanna know more",
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
                  max: 10.0,
                  value: _value,
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
