import 'package:flutter/material.dart';

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
