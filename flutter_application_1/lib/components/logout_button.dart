import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/snackbar.dart';

import '../Log/log_page.dart';

class LogOutButton extends StatelessWidget {
  final String? type;

  const LogOutButton({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: RawMaterialButton(
        fillColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        onPressed: () async {
          switch (type) {
            case "Notloged":
              {
                getSnackBar(
                    context, 'Connectez vous pour pouvoir vous déconnecter');
              }
              break;
            default:
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LogPage()));
              break;
          }
        },
        child: const Icon(
          Icons.logout,
          size: 24.0,
        ),
      ),
    );
  }
}
