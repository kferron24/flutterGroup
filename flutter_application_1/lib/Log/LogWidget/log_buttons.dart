import 'package:flutter/material.dart';

import '../../components/snackbar.dart';
import '../../firebase/firebase_log.dart';
import '../../home_screen.dart';

class LogButtons extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogButtons({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    String response = '';
    return Column(
      children: [
        const SizedBox(height: 40.0),
        SizedBox(
          width: double.infinity,
          child: RawMaterialButton(
            fillColor: Theme.of(context).secondaryHeaderColor,
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
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
            fillColor: Theme.of(context).primaryColorDark,
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
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
