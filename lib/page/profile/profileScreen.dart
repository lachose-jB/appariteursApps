import 'package:appariteurs/page/profile/components/bodyp.dart';
import 'package:flutter/material.dart';

import '../../components/topNavBar.dart';
import '../notif/notifScreen.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        onNotificationPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },
        PageName: "Profile", // Pass the page name here
      ),
      backgroundColor: Colors.blueAccent,
      body:  const BodyPr(),
      // bottomNavigationBar: MyBottomBar(selectedMenu: MenuState.pv,),
    );
  }
}