import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/snackbar.dart';
import '../Profile/profile_screen.dart';
import '../home_screen.dart';

class ProfileButton extends StatelessWidget {
  final String? type;
  const ProfileButton({super.key, this.type});

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
            switch (type) {
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
                break;
              case "Notloged":
                {
                  getSnackBar(context,
                      'Connectez vous pour pouvoir accèder à votre profile');
                }
                break;
              default:
                break;
            }
          },
          child: (type == 'Notloged' || type == 'Profile')
              ? const Icon(
                  Icons.account_circle_sharp,
                  size: 24.0,
                )
              : const Icon(
                  Icons.home,
                  size: 24.0,
                )),
    );
  }
}
