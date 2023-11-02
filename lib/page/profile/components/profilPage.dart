import 'package:appariteurs/helper/user.dart';
import 'package:appariteurs/helper/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appariteurs/page/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserData? userinit;
  String dataSemail ="";
  String dataSpassword ="";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController lieuxPlaceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool isEditing = false;
  Future<void> getStoredEmailAndPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (storedEmail != null && storedPassword != null) {
      // Use the stored email and password as needed in your profilPage
      dataSemail= storedEmail;

      print('User ID: $storedEmail');
      dataSpassword = storedPassword;
    }
  }
  Future<UserData?> getUserDataFromStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getInt('user_id');
    final appariteurId = prefs.getInt('appariteur_id');
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final tel = prefs.getString('tel');
    final sexe = prefs.getString('sexe');
    final image = prefs.getString('image');
    final adresse = prefs.getString('adresse');
    final datenais = prefs.getString('datenais');
    final lieunais = prefs.getString('lieunais');
    final rue = prefs.getString('rue');
    final codepostal = prefs.getString('codepostal');
    final ville = prefs.getString('ville');
    final pays = prefs.getString('pays');
    final niveau = prefs.getString('niveau');
    final user = prefs.getString('user');

    if (userId != null && appariteurId != null) {
      return UserData(
        userId: userId.toString(),
        appariteurId: appariteurId.toString(),
        name: name ?? '',
        email: email ?? '',
        tel: tel ?? '',
        sexe: sexe ?? '',
        image: image ?? '',
        adresse: adresse ?? '',
        datenais: datenais ?? '',
        lieunais: lieunais ?? '',
        rue: rue ?? '',
        codepostal: codepostal ?? '',
        ville: ville ?? '',
        pays: pays ?? '',
        niveau: niveau ?? '',
        user: user ?? '',
      );
    } else {
      return null;
    }
  }
  Future<void> getUserDataInStorage() async {
    final prefs = await SharedPreferences.getInstance();

    // Récupérez les données de l'utilisateur depuis SharedPreferences
    UserData? userData = await getUserDataFromStorage();

    if (userData != null) {
      // Remplissez vos contrôleurs de texte avec les données de l'utilisateur récupérées
      nameController.text = userData.name;
      emailController.text = userData.email;
      genderController.text = userData.sexe;
      phoneNumberController.text = userData.tel;
      birthDateController.text = userData.datenais;
      lieuxPlaceController.text = userData.lieunais;
      addressController.text = userData.rue;
      postalCodeController.text = userData.codepostal;
      countryController.text = userData.pays;
      } else {
      // Gérez le cas où la récupération des données de l'utilisateur a échoué.
      print('Échec de la récupération des données de l\'utilisateur.');
      }
      }

  @override
  void initState() {
    super.initState();
    getStoredEmailAndPassword();
    getUserDataFromStorage();
    getUserDataInStorage();
  }
  @override
  Widget build(BuildContext context) {
    getUserDataFromStorage();
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