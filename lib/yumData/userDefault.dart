import 'ClienData.dart';
import 'appariteurClass.dart';
import 'planningClass.dart';
import 'userClass.dart';
// Importez le fichier etablissement.dart
class UserActif {
  User user;
  Appariteur appariteur;
  Planning planning;
  Etablissement etablissement;

  UserActif({
    required this.user,
    required this.appariteur,
    required this.planning,
    required this.etablissement,
  });

  // Créez une méthode statique pour initialiser un utilisateur actif
  static UserActif initUserActif() {
    final User user = User.getDefaultUser();
    final Appariteur appariteur = AppariteurDefault.initDefaultAppariteur();
    final Planning planning = Planning.getDefaultPlanning();
    final Etablissement etablissement = Etablissement.initEtablissement();

    return UserActif(
      user: user,
      appariteur: appariteur,
      planning: planning,
      etablissement: etablissement,
    );
  }
}
