import 'package:appariteurs/helper/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
String dataSemail ="";
String dataSpassword ="";
class UserData {
  late final String userId;
  late final String appariteurId;
  late final String name;
  late final String email;
  late final String tel;
  late final String sexe;
  late final String image;
  late final String adresse;
  late final String datenais;
  late final String lieunais;
  late final String rue;
  late final String codepostal;
  late final String ville;
  late final String pays;
  late final String niveau;
  late final String user;

  UserData({
    required this.userId,
    required this.appariteurId,
    required this.name,
    required this.email,
    required this.tel,
    required this.sexe,
    required this.image,
    required this.adresse,
    required this.datenais,
    required this.lieunais,
    required this.rue,
    required this.codepostal,
    required this.ville,
    required this.pays,
    required this.niveau,
    required this.user,
  });

}
UserData userinit = UserData(
  userId: 'user_id',
  appariteurId: 'appariteur_id',
  name: 'name',
  email: 'email',
  tel: 'tel',
  sexe: 'sexe',
  image: 'image',
  adresse: 'adresse',
  datenais: 'datenais',
  lieunais: 'lieunais',
  rue: 'rue',
  codepostal: 'codepostal',
  ville: 'ville',
  pays: 'pays',
  niveau: 'niveau',
  user: 'user',
);
Future<void> saveUserDataToStorage(UserData user) async {
  final prefs = await SharedPreferences.getInstance();
  UserData? userData = await UserController.login(dataSemail, dataSpassword);
  if (userData != null) {
  prefs.setInt(userData.userId, user.userId as int);
  prefs.setInt(userData.appariteurId, user.appariteurId as int);
  prefs.setString(userData.name, user.name);
  prefs.setString(userData.email, user.email);
  prefs.setString(userData.tel, user.tel);
  prefs.setString(userData.sexe, user.sexe);
  prefs.setString(userData.image, user.image);
  prefs.setString(userData.adresse, user.adresse);
  prefs.setString(userData.datenais, user.datenais);
  prefs.setString(userData.lieunais, user.lieunais);
  prefs.setString(userData.rue, user.rue);
  prefs.setString(userData.codepostal, user.codepostal);
  prefs.setString(userData.codepostal, user.ville);
  prefs.setString(userData.pays, user.pays);
  prefs.setString(userData.niveau, user.niveau);
  prefs.setString(userData.user, user.user);
  }
}
Future<void> getUserData() async {
  UserData? userData = await UserController.login(dataSemail, dataSpassword);

  if (userData != null) {
    // You have the initial user data, you can now use it as needed.
    print('User ID: ${userData.userId}');
    print('User Name: ${userData.name}');
    // ... other user properties
  } else {
    // Handle the case where user data retrieval failed.
    print('User data retrieval failed.');
  }
}