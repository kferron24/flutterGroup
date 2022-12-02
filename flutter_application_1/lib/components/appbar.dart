import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/logout_button.dart';
import 'package:flutter_application_1/components/profile_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? type;
  const CustomAppBar({Key? key, required this.type})
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
            child: Text(
              'QUIZZ',
              style:
                  TextStyle(color: Theme.of(context).primaryColor, fontSize: 32),
            ),
          ),
          Row(
            children: [
              ProfileButton(type: widget.type),
              LogOutButton(type: widget.type),
            ],
          )
        ],
      ),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
    );
  }
}
