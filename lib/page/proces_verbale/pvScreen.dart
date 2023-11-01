import 'package:appariteurs/components/newPv.dart';
import 'package:flutter/material.dart';
import '../../components/topNavBar.dart';
import '../notif/notifScreen.dart';
import 'components/body.dart';

class PvScreen extends StatelessWidget {
  static String routeName = "/pv";
  const PvScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        onNotificationPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen()));
        },
        PageName: "Proces Verbales", // Pass the page name here
      ),
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => PvNew()), );// Appelle la fonction pour afficher le pop-up// Action à effectuer lorsque le bouton est cliqué
        },
        child: const Icon(Icons.add),
      ),
      body: const BodyPv(),
      // bottomNavigationBar: MyBottomBar(selectedMenu: MenuState.pv,),
    );
  }
}
