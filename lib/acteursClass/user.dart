class User {
  int? userId;
  String? name;
  String? email;
  String? tel;
  String? sexe;
  String? image;
  String? password;
  String? emailVerificaty;
  String? rememberToken;
  String? statut;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.userId,
    this.name,
    this.email,
    this.tel,
    this.sexe,
    this.image,
    this.password,
    this.emailVerificaty,
    this.rememberToken,
    this.statut,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? get getUserId => userId;

  set setUserId(int? value) {
    userId = value;
  }

  String? get getName => name;

  set setName(String? value) {
    name = value;
  }

  String? get getEmail => email;

  set setEmail(String? value) {
    email = value;
  }

  String? get getTel => tel;

  set setTel(String? value) {
    tel = value;
  }

  String? get getSexe => sexe;

  set setSexe(String? value) {
    sexe = value;
  }

  String? get getImage => image;

  set setImage(String? value) {
    image = value;
  }

  String? get getPassword => password;

  set setPassword(String? value) {
    password = value;
  }

  String? get getEmailVerificaty => emailVerificaty;

  set setEmailVerificaty(String? value) {
    emailVerificaty = value;
  }

  String? get getRememberToken => rememberToken;

  set setRememberToken(String? value) {
    rememberToken = value;
  }

  String? get getStatut => statut;

  set setStatut(String? value) {
    statut = value;
  }

  DateTime? get getDeletedAt => deletedAt;

  set setDeletedAt(DateTime? value) {
    deletedAt = value;
  }

  DateTime? get getCreatedAt => createdAt;

  set setCreatedAt(DateTime? value) {
    createdAt = value;
  }

  DateTime? get getUpdatedAt => updatedAt;

  set setUpdatedAt(DateTime? value) {
    updatedAt = value;
  }

  // Initialisation par défaut
  static User getDefaultUser() {
    return User(
      userId: 1,
      name: 'Nom par défaut',
      email: 'email@exemple.com',
      tel: '000-000-0000',
      sexe: 'Homme / Femme c',
      image: 'chemin/image.jpg',
      password: 'motdepasse',
      emailVerificaty: 'verifie@example.com',
      rememberToken: 'jeton',
      statut: 'Actif',
      deletedAt: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
