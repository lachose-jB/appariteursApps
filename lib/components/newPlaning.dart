import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

class PlaningNew extends StatefulWidget {
  const PlaningNew({Key? key});
  @override
  State<PlaningNew> createState() => _PlaningNewState();
}
class UserAvailability {
  DateTime date;
  TimeOfDay heureDebut;
  TimeOfDay heureFin;

  UserAvailability({required this.date, required this.heureDebut, required this.heureFin});
}
class _PlaningNewState extends State<PlaningNew> {
  // Ajoutez votre logique de sélection de dates et d'événements ici
  // Utilisez le package flutter_date_pickers pour le calendrier
  // et créez une liste d'événements
  // Assurez-vous de mettre à jour l'UI en fonction des sélections de l'utilisateur

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrer vos Disponibilités'),
        leading: IconButton(
          icon: const Icon(Icons.close), // Utilisez l'icône de croix (X)
          onPressed: () {
            Navigator.of(context).pop(); // Vous pouvez utiliser Navigator pour revenir en arrière
          },
        ),
      ),
      body: const Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ajoutez le calendrier ici
          // Utilisez le package flutter_date_pickers pour créer le calendrier
          // et gérez la sélection de dates

          // Ajoutez une ListView pour afficher les événements
          // Vous pouvez utiliser un ListView.builder pour afficher la liste des événements
        ],
      ),
      ),
    );
  }
}