
import 'userClass.dart';

class Appariteur {
  int? appariteurId;
  String? adresse;
  String? dateNaissance;
  String? lieuNaissance;
  String? rue;
  String? codePostal;
  String? ville;
  String? pays;
  int? niveauId;
  int? userId;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user; // Référence à la classe User

  Appariteur({
    this.appariteurId,
    this.adresse,
    this.dateNaissance,
    this.lieuNaissance,
    this.rue,
    this.codePostal,
    this.ville,
    this.pays,
    this.niveauId,
    this.userId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.user, // Initialiser un utilisateur lié ici
  });

  int? get getAppariteurId => appariteurId;


  set setAppariteurId(int? value) {
    appariteurId = value;
  }

  String? get getAdresse => adresse;

  set setAdresse(String? value) {
    adresse = value;
  }

  String? get getDateNaissance => dateNaissance;

  set setDateNaissance(String? value) {
    dateNaissance = value;
  }

  // Ajoutez les getters et les setters pour les autres propriétés

  User? get getUser => user;

  set setUser(User? value) {
    user = value;
  }
}


class AppariteurDefault {
  static Appariteur initDefaultAppariteur() {
    final User defaultUser = User(
      userId: 1,
      name: 'Nom par défaut',
      email: 'email@exemple.com',
      // Initialisez les autres propriétés de l'utilisateur par défaut ici
    );

    return Appariteur(
      appariteurId: 1,
      adresse: 'Adresse par défaut',
      dateNaissance: 'Date de naissance par défaut',
      lieuNaissance: 'Lieu de naissance par défaut',
      rue: 'Rue par défaut',
      codePostal: 'Code postal par défaut',
      ville: 'Ville par défaut',
      pays: 'Pays par défaut',
      niveauId: 1,
      userId: defaultUser.userId,
      deletedAt: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      user: defaultUser,
    );
  }
}