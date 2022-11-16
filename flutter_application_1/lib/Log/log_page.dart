import 'package:flutter/material.dart';
import 'package:flutter_application_1/Log/LogWidget/log_input.dart';
import 'package:flutter_application_1/Log/LogWidget/log_welcome.dart';

import 'LogWidget/log_buttons.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
          backgroundColor: const Color.fromRGBO(212, 111, 77, 1),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogWelcome(),
                LogInputs(
                    emailController: emailController,
                    passwordController: passwordController),
                LogButtons(
                    emailController: emailController,
                    passwordController: passwordController)
              ],
            ))));
  }
}
