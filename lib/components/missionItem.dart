import 'package:flutter/material.dart';

class MissionItem extends StatelessWidget {
  final String date;
  final String refCommande;
  final String etablissement;
  final String client;
  final String lieu;
  final String salle;
  final String duree;
  final String heures;

  MissionItem({
    required this.date,
    required this.refCommande,
    required this.etablissement,
    required this.client,
    required this.lieu,
    required this.salle,
    required this.duree,
    required this.heures,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrer une mission'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Client
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: '', child: Text('Sélectionnez')),
                  DropdownMenuItem(value: 'SFS', child: Text('SFS')),
                  DropdownMenuItem(value: 'GEDH', child: Text('GEDH')),
                  // Ajoutez d'autres éléments DropdownMenuItem au besoin
                ],
                decoration: const InputDecoration(
                  labelText: 'Client',
                ),
                onChanged: (value) {
                  // Gérez la sélection du client ici
                },
              ),
              // Date de Prestation
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Date de Prestation',
                  suffixIcon: Icon(Icons.date_range),
                ),
                keyboardType: TextInputType.datetime,
              ),
              // Lieu de Prestation
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lieu de Prestation',
                ),
              ),
              // Matinée / Soirée
              Row(
                children: [
                  Radio(
                    value: 'Matinée',
                    groupValue: 'matin_soir',
                    onChanged: (value) {
                      // Gérez le choix Matinée ici
                    },
                  ),
                  const Text('Matinée'),
                  Radio(
                    value: 'Soirée',
                    groupValue: 'matin_soir',
                    onChanged: (value) {
                      // Gérez le choix Soirée ici
                    },
                  ),
                  const Text('Soirée'),
                ],
              ),
              // Salle
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Salle',
                ),
              ),
              // Durée
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Durée',
                ),
                keyboardType: TextInputType.datetime,
              ),
              // Heure de Début
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'H. Début',
                ),
                keyboardType: TextInputType.datetime,
              ),
              // Heure de Fin
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'H. Fin',
                ),
                keyboardType: TextInputType.datetime,
              ),
              // Mission
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mission',
                ),
                maxLines: 3,
              ),
              ElevatedButton(
                onPressed: () {
                  // Soumettez le formulaire ici
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
