import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Text(
        title,
        style: const TextStyle(
          color: Color.fromRGBO(0, 53, 63, 1),
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
