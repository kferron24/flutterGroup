import 'package:flutter/material.dart';

import '../components/appbar.dart';
import 'LogWidget/log_buttons.dart';
import 'LogWidget/log_input.dart';
import 'LogWidget/log_welcome.dart';

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
        appBar: const CustomAppBar(
          type: 'Notloged',
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
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
            )));
  }
}
