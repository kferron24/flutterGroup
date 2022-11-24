import 'package:flutter/material.dart';

import 'package:flutter_application_1/Log/profile_screen.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/homepage.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String? type;
  CustomAppBar({Key? key, required this.type})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    double widthog = MediaQuery.of(context).size.width;
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            'QUIZZ',
            style: TextStyle(color: Color.fromRGBO(67, 12, 5, 1)),
          ),
          const SizedBox(
            width: 200,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(255, 0, 0, 0), width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(35.0))), //
            child: RawMaterialButton(
              fillColor: const Color.fromRGBO(0, 53, 63, 1),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              onPressed: () async {
                switch (widget.type) {
                  case "Profile":
                    {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                    }
                    break;
                  case "Login":
                    {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }
                }
              },
              child: const Text("Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  )),
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(212, 111, 77, 1),
    );
  }
}
