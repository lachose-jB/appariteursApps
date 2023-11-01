import 'package:appariteurs/components/newPlaning.dart';
import 'package:flutter/material.dart';

class BodyPl extends StatefulWidget {
  const BodyPl({Key? key}) : super(key: key);

  @override
  State<BodyPl> createState() => _BodyPlState();
}
class _BodyPlState extends State<BodyPl> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaningNew()), // Naviguez vers la page de planification
                );
              },
              child: Text('Ouvrir Planification'),
            ),
          ],
        ),
      ),
    );
  }
}
