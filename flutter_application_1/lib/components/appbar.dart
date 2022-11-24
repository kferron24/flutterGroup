import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/logout_button.dart';
import 'package:flutter_application_1/components/profile_button.dart';

import '../Log/log_page.dart';
import '../Profile/profile_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
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
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: const Text(
              'QUIZZ',
              style:
                  TextStyle(color: Color.fromRGBO(67, 12, 5, 1), fontSize: 32),
            ),
          ),
          Row(
            children: const [
              ProfileButton(),
              LogOutButton(),
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(212, 111, 77, 1),
    );
  }
}
