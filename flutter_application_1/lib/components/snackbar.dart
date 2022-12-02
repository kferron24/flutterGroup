import 'package:flutter/material.dart';

void getSnackBar(context, response) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(response),
      duration: const Duration(milliseconds: 3000),
      backgroundColor: Theme.of(context).primaryColorLight,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
