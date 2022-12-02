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
        decoration: InputDecoration(
          hintText: "User Email",
          prefixIcon: Icon(
            Icons.mail,
            color: Theme.of(context).primaryColor,
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
        decoration: InputDecoration(
          hintText: "User Password",
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      const SizedBox(height: 15.0),
      Text(
        "Don't remember your password",
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    ]);
  }
}
