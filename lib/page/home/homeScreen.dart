import 'package:flutter/material.dart';
import '../../components/topNavBar.dart';
import '../notif/notifScreen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        onNotificationPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },
        PageName: "Accueil", // Pass the page name here
      ),
      backgroundColor: Colors.grey,
      body:  const Body(),
      //bottomNavigationBar: MyBottomBar(),
    );
  }
}
