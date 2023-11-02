import 'package:appariteurs/page/profile/components/profilPage.dart';
import 'package:appariteurs/page/profile/components/profile_menu.dart';
import 'package:appariteurs/page/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
class BodyPr extends StatelessWidget {
  const BodyPr({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
            text: "Mon Compte",
            icon: "assets/icons/User Icon.svg",
            press: () => {
            Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage()),),
            },
            ),
            ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
            ),
            ProfileMenu(
            text: "Contrat",
            icon: "assets/icons/task.svg",
            press: () {},
            ),
            ProfileMenu(
            text: "Document",
            icon: "assets/icons/doc.svg",
            press: () {},
            ),
            ProfileMenu(
            text: "Paramettre",
            icon: "assets/icons/Settings.svg",
            press: () {},
            ),
            ProfileMenu(
            text: "Aide",
            icon: "assets/icons/Question mark.svg",
            press: () {},
            ),
            ProfileMenu(
            text: "Déconnexion",
            icon: "assets/icons/Log out.svg",
            press: () {},
            ),
          ],
        ),
    );
  }
}
