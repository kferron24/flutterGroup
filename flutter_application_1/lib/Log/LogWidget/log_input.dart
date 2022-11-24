import 'package:flutter/material.dart';

class LogInputs extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogInputs({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: emailController,
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
        controller: passwordController,
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
    ]);
  }
}
