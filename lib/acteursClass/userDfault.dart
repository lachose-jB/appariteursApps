class UserModel {
  UserModel({
    required this.user_id,
    required this.appariteur_id,
    required this.name,
    required this.email,
    required this.sexe,
    required this.status,
    required this.image,
    required this.adresse,
    required this.datenais,
    required this.lieunais,
    required this.rue,
    required this.code_postal,
    required this.ville,
    required this.pays,
    required this.niveau,
  });

  late final int user_id;
  late final int appariteur_id;
  late final String name;
  late final String email;
  late final String sexe;
  late final String status;
  late final String image;
  late final String adresse;
  late final String datenais;
  late final String lieunais;
  late final String rue;
  late final String code_postal;
  late final String ville;
  late final String pays;
  late final String niveau;

  // Getters and Setters
  int get getUserId => user_id;
  set setUserId(int value) => user_id = value;

  int get getAppariteurId => appariteur_id;
  set setAppariteurId(int value) => appariteur_id = value;

  String get getName => name;
  set setName(String value) => name = value;

  String get getEmail => email;
  set setEmail(String value) => email = value;

  String get getSexe => sexe;
  set setSexe(String value) => sexe = value;

  String get getStatus => status;
  set setStatus(String value) => status = value;

  String get getImage => image;
  set setImage(String value) => image = value;

  String get getAdresse => adresse;
  set setAdresse(String value) => adresse = value;

  String get getDateNais => datenais;
  set setDateNais(String value) => datenais = value;

  String get getLieuNais => lieunais;
  set setLieuNais(String value) => lieunais = value;

  String get getRue => rue;
  set setRue(String value) => rue = value;

  String get getCodePostal => code_postal;
  set setCodePostal(String value) => code_postal = value;

  String get getVille => ville;
  set setVille(String value) => ville = value;

  String get getPays => pays;
  set setPays(String value) => pays = value;

  String get getNiveau => niveau;
  set setNiveau(String value) => niveau = value;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json['user_id'],
      appariteur_id: json['appariteur_id'],
      name: json['name'],
      email: json['email'],
      sexe: json['sexe'],
      status: json['status'],
      image: json['image'],
      adresse: json['adresse'],
      datenais: json['datenais'],
      lieunais: json['lieunais'],
      rue: json['rue'],
      code_postal: json['code_postal'],
      ville: json['ville'],
      pays: json['pays'],
      niveau: json['niveau'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = user_id;
    _data['appariteur_id'] = appariteur_id;
    _data['name'] = name;
    _data['email'] = email;
    _data['sexe'] = sexe;
    _data['status'] = status;
    _data['image'] = image;
    _data['adresse'] = adresse;
    _data['datenais'] = datenais;
    _data['lieunais'] = lieunais;
    _data['rue'] = rue;
    _data['code_postal'] = code_postal;
    _data['ville'] = ville;
    _data['pays'] = pays;
    _data['niveau'] = niveau;
    return _data;
  }
}