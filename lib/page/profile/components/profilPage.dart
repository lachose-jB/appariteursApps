import 'package:appariteurs/acteursClass/userDfault.dart';
import 'package:appariteurs/page/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

import '../../../helper/helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool isEditing = false;
  ApiHelper apiHelper = ApiHelper();
  late UserModel user;
  _ProfilePageState() {
    user = UserModel(
      user_id: user.user_id,
      appariteur_id: user.appariteur_id,
      name: user.getName,
      email: user.getEmail,
      sexe: user.getSexe,
      status: user.getStatus,
      image: user.image,
      adresse: user.getAdresse,
      datenais: user.getDateNais,
      lieunais: user.getLieuNais,
      rue: user.getRue,
      code_postal: user.getCodePostal,
      ville: user.getVille,
      pays: user.getPays,
      niveau: user.getNiveau,
    );
  }
  @override
  void initState() {
    super.initState();
    // Set the initial values for the TextFormFields
    nameController.text = user.getName;
    genderController.text = user.getSexe;
    birthDateController.text = user.getDateNais;
    birthPlaceController.text = user.getLieuNais;
    emailController.text = user.getEmail;
    // Add similar lines for the other fields
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0, // Supprime la boîte d'ombre de la barre d'applications
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Bords inférieurs arrondis
          ),
        ),
        title: const Center(
          child: Text(
            "Mon compte",
            style: TextStyle(
              color: Colors.white, // Couleur du texte
              fontSize: 24, // Taille du texte
              fontWeight: FontWeight.bold, // Style de police
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications), // Icône à droite
            onPressed: () {
              // Action à effectuer lorsque l'icône à droite est cliquée
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const ProfilePic(),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Nom",
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: genderController,
                        decoration: const InputDecoration(
                          labelText: 'Sexe',
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: birthDateController,
                        decoration: const InputDecoration(
                          labelText: 'Date de naissance',
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: birthPlaceController,
                        decoration: const InputDecoration(
                          labelText: 'Lieux de naissance',
                        ),
                        readOnly: !isEditing,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Mail',
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Téléphone',
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          labelText: 'Adresse',
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: postalCodeController,
                        decoration: const InputDecoration(
                          labelText: 'Code postal',
                        ),
                        readOnly: !isEditing,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: countryController,
                        decoration: const InputDecoration(
                          labelText: 'Pays',
                        ),
                        readOnly: !isEditing,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    child: Text(isEditing ? 'Enregistrer' : 'Modifier'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Mettez ici la logique pour supprimer le profil
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('Supprimer'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}