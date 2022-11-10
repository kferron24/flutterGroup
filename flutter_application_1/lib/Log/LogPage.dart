import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import '../QuestionWidgets/MultipleChoiceQuestion.dart';
import '../QuestionWidgets/DichotomicQuestion.dart';
import '../HomePage.dart';
import '../HomeScreen.dart';
import 'ProfileScreen.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  //Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email.");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                'QUIZZ',
                style: TextStyle(
                  color: Color.fromRGBO(67, 12, 5, 1),
                ),
              ),
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
                  "WELCOME TO",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "QUIZZ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Login to the app",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 53, 63, 1),
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "User Email",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromRGBO(67, 12, 5, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                TextField(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "User Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(67, 12, 5, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "Don't remember your password",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 53, 63, 1),
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Color.fromRGBO(212, 111, 77, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
                    },
                    child: const Text("Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        )),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Color.fromRGBO(0, 53, 63, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim());
                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
                    },
                    child: const Text("Sign Up",
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
