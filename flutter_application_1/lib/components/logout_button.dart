import 'package:flutter/material.dart';

import '../Log/log_page.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: RawMaterialButton(
        fillColor: const Color.fromRGBO(67, 12, 5, 1),
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        onPressed: () async {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LogPage()));
        },
        child: const Icon(
          Icons.logout,
          size: 24.0,
        ),
      ),
    );
  }
}
