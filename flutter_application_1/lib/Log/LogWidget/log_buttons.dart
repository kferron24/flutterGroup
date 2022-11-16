import 'package:flutter/material.dart';

import '../../home_screen.dart';
import '../firebase_log.dart';

class LogButtons extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogButtons({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  void getSnackBar(context, response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response),
        duration: const Duration(milliseconds: 3000),
        backgroundColor: const Color.fromARGB(255, 0, 161, 172),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String response = '';
    return Column(
      children: [
        const SizedBox(height: 40.0),
        SizedBox(
          width: double.infinity,
          child: RawMaterialButton(
            fillColor: const Color.fromRGBO(212, 111, 77, 1),
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            onPressed: () async {
              response = await loginUsingEmailPassword(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context);
              if (response.isNotEmpty) {
                // ignore: use_build_context_synchronously
                getSnackBar(context, response);
                return;
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text("Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                )),
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          width: double.infinity,
          child: RawMaterialButton(
            fillColor: const Color.fromRGBO(0, 53, 63, 1),
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            onPressed: () async {
              response = await registerUsingEmailPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  context: context);
              if (response.isNotEmpty) {
                // ignore: use_build_context_synchronously
                getSnackBar(context, response);
                return;
              }
              await userSetup(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  context: context);
              response = await loginUsingEmailPassword(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context);
              if (response.isNotEmpty) {
                // ignore: use_build_context_synchronously
                getSnackBar(context, response);
                return;
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text("Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
          ),
        ),
      ],
    );
  }
}
