import 'package:appariteurs/acteursClass/user.dart';
import 'package:appariteurs/helper/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appariteurs/page/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

import '../../../storage/sqlLite.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData? userData;
  bool isEditing = false;
  late DatabaseHelper databaseHelper;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController lieuxPlaceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Future<void> getStoredEmailAndPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (storedEmail != null && storedPassword != null) {
      userData = await UserController.login(storedEmail, storedPassword);
    }
  }

  Future<void> getUserDataFromDatabase() async {
    databaseHelper = DatabaseHelper.instance;
    List<Map<String, dynamic>> users = await databaseHelper.getUsers();

    if (users.isNotEmpty) {
      Map<String, dynamic> userMap = users.first;
      userData = UserData(
        userId: userMap[databaseHelper.columnUserId],
        appariteurId: userMap[databaseHelper.columnAppariteurId],
        name: userMap[databaseHelper.columnName],
        email: userMap[databaseHelper.columnEmail],
        tel: userMap[databaseHelper.columnTel],
        sexe: userMap[databaseHelper.columnSexe],
        image: userMap[databaseHelper.columnImage],
        adresse: userMap[databaseHelper.columnAdresse],
        datenais: userMap[databaseHelper.columnDatenais],
        lieunais: userMap[databaseHelper.columnLieunais],
        rue: userMap[databaseHelper.columnRue],
        codepostal: userMap[databaseHelper.columnCodepostal],
        ville: userMap[databaseHelper.columnVille],
        pays: userMap[databaseHelper.columnPays],
        niveau: userMap[databaseHelper.columnNiveau],
        user: userMap[databaseHelper.columnUser],
      );

      nameController.text = userData!.name;
      emailController.text = userData!.email;
      genderController.text = userData!.sexe;
      phoneNumberController.text = userData!.tel;
      birthDateController.text = userData!.datenais;
      lieuxPlaceController.text = userData!.lieunais;
      addressController.text = userData!.adresse;
      postalCodeController.text = userData!.codepostal;
      countryController.text = userData!.pays;
    }
  }

  @override
  void initState() {
    super.initState();
    getStoredEmailAndPassword();
    getUserDataFromDatabase();
  }
  @override
  Widget build(BuildContext context) {
    getUserData();
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
                        controller: lieuxPlaceController,
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