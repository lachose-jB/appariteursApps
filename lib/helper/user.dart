import 'package:appariteurs/helper/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  late String userId;
  late String appariteurId;
  late String name;
  late String email;
  late String tel;
  late String sexe;
  late String image;
  late String adresse;
  late String datenais;
  late String lieunais;
  late String rue;
  late String codepostal;
  late String ville;
  late String pays;
  late String niveau;
  late String user;

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

Future<UserData?> getUserDataFromStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('userId') ?? -1; // Replace -1 with a default value
  if (userId == -1) {
    return null;
  }

  return UserData(
    userId: userId.toString(),
    appariteurId: prefs.getInt('appariteurId')?.toString() ?? '',
    name: prefs.getString('name') ?? '',
    email: prefs.getString('email') ?? '',
    tel: prefs.getString('tel') ?? '',
    sexe: prefs.getString('sexe') ?? '',
    image: prefs.getString('image') ?? '',
    adresse: prefs.getString('adresse') ?? '',
    datenais: prefs.getString('datenais') ?? '',
    lieunais: prefs.getString('lieunais') ?? '',
    rue: prefs.getString('rue') ?? '',
    codepostal: prefs.getString('codepostal') ?? '',
    ville: prefs.getString('ville') ?? '',
    pays: prefs.getString('pays') ?? '',
    niveau: prefs.getString('niveau') ?? '',
    user: prefs.getString('user') ?? '',
  );
}
Future<void> saveUserDataToStorage(UserData user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('userId', int.parse(user.userId));
  prefs.setInt('appariteurId', int.parse(user.appariteurId));
  prefs.setString('name', user.name);
  prefs.setString('email', user.email);
  prefs.setString('tel', user.tel);
  prefs.setString('sexe', user.sexe);
  prefs.setString('image', user.image);
  prefs.setString('adresse', user.adresse);
  prefs.setString('datenais', user.datenais);
  prefs.setString('lieunais', user.lieunais);
  prefs.setString('rue', user.rue);
  prefs.setString('codepostal', user.codepostal);
  prefs.setString('ville', user.ville);
  prefs.setString('pays', user.pays);
  prefs.setString('niveau', user.niveau);
  prefs.setString('user', user.user);
}
