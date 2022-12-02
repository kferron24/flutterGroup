import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(67, 12, 5, 1),
        secondaryHeaderColor:const Color.fromRGBO(212, 111, 77, 1),
        primaryColorLight: Color.fromARGB(255, 0, 161, 172),
        primaryColorDark: const Color.fromRGBO(0, 53, 63, 1),
          scaffoldBackgroundColor: const Color.fromRGBO(255, 191, 102, 1),
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color.fromRGBO(67, 12, 5, 1),
          ),
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return const Color.fromRGBO(67, 12, 5, 1);
              }
              return null;
            }),
            trackColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return const Color.fromRGBO(67, 12, 5, 1);
              }
              return null;
            }),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return const Color.fromRGBO(67, 12, 5, 1);
              }
              return null;
            }),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Color.fromRGBO(67, 12, 5, 1)), //<-- SEE HERE
            ),
          ),
          sliderTheme: const SliderThemeData(
            thumbColor:Color.fromRGBO(67, 12, 5, 1),
            overlayColor: Color.fromRGBO(67, 12, 5, 1),
            activeTrackColor: Color.fromRGBO(67, 12, 5, 1),
            inactiveTrackColor: Color.fromRGBO(67, 12, 5, 200),
            inactiveTickMarkColor: Color.fromRGBO(67, 12, 5, 1),
          ),
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return const Color.fromRGBO(67, 12, 5, 1);
              }
              return null;
            }),
          )),
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
