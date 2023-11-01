import 'package:appariteurs/components/topNavBar.dart';
import 'package:flutter/material.dart';
import 'package:appariteurs/page/notif/notifScreen.dart';
import '../../components/newPlaning.dart';
import 'components/body.dart';

class PlanningScreen extends StatelessWidget {
  static String routeName = "/planning";

  PlanningScreen({Key? key}) : super(key: key);
  // Replace with your actual notification count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        onNotificationPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },
        PageName: "Mon Planning", // Pass the page name here
      ),
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaningNew()));
        },
        child: const Icon(Icons.add),
      ),
      body: const BodyPl(),
    );
  }
}
