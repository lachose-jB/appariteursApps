class Etablissement {
  int? etabliId;
  String? nameEtabli;
  String? adresse;
  String? codePostal;
  String? localite;
  String? pays;
  DateTime? deletedAt;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;

  Etablissement({
    this.etabliId,
    this.nameEtabli,
    this.adresse,
    this.codePostal,
    this.localite,
    this.pays,
    this.deletedAt,
    this.logo,
    this.createdAt,
    this.updatedAt,
  });
  // Constructeur pour l'initialisation
  Etablissement.initEtablissement() {
    etabliId = 0;
    nameEtabli = '';
    adresse = '';
    codePostal = '';
    localite = '';
    logo = '';
  }

  int? get getEtabliId => etabliId;

  set setEtabliId(int? value) {
    etabliId = value;
  }

  String? get getNameEtabli => nameEtabli;

  set setNameEtabli(String? value) {
    nameEtabli = value;
  }

  String? get getAdresse => adresse;

  set setAdresse(String? value) {
    adresse = value;
  }

  String? get getCodePostal => codePostal;

  set setCodePostal(String? value) {
    codePostal = value;
  }

  String? get getLocalite => localite;

  set setLocalite(String? value) {
    localite = value;
  }

  String? get getPays => pays;

  set setPays(String? value) {
    pays = value;
  }

  DateTime? get getDeletedAt => deletedAt;

  set setDeletedAt(DateTime? value) {
    deletedAt = value;
  }

  String? get getLogo => logo;

  set setLogo(String? value) {
    logo = value;
  }

  DateTime? get getCreatedAt => createdAt;

  set setCreatedAt(DateTime? value) {
    createdAt = value;
  }

  DateTime? get getUpdatedAt => updatedAt;

  set setUpdatedAt(DateTime? value) {
    updatedAt = value;
  }
}
