import 'package:appariteurs/components/newMission.dart';
import 'package:flutter/material.dart';
import '../../components/topNavBar.dart';
import '../notif/notifScreen.dart';
import 'components/body.dart';

class MissionScreen extends StatelessWidget {
  static String routeName = "/mission";
  const MissionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        onNotificationPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },
        PageName: "Mes Mission", // Pass the page name here
      ),
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => MissionNew()), );// Action à effectuer lorsque le bouton est cliqué
        },
        child: const Icon(Icons.add),
      ),
      body: const BodyM(),
    );
  }
}
