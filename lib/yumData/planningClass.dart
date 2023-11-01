class Planning {
  int? planningId;
  DateTime? date;
  String? heureDebutMatin;
  String? heureFinMatin;
  String? heureDebutSoir;
  String? heureFinSoir;
  String? etat;
  int? appariteurId;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Planning({
    this.planningId,
    this.date,
    this.heureDebutMatin,
    this.heureFinMatin,
    this.heureDebutSoir,
    this.heureFinSoir,
    this.etat,
    this.appariteurId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? get getPlanningId => planningId;

  set setPlanningId(int? value) {
    planningId = value;
  }

  DateTime? get getDate => date;

  set setDate(DateTime? value) {
    date = value;
  }

  String? get getHeureDebutMatin => heureDebutMatin;

  set setHeureDebutMatin(String? value) {
    heureDebutMatin = value;
  }

  String? get getHeureFinMatin => heureFinMatin;

  set setHeureFinMatin(String? value) {
    heureFinMatin = value;
  }

  String? get getHeureDebutSoir => heureDebutSoir;

  set setHeureDebutSoir(String? value) {
    heureDebutSoir = value;
  }

  String? get getHeureFinSoir => heureFinSoir;

  set setHeureFinSoir(String? value) {
    heureFinSoir = value;
  }

  String? get getEtat => etat;

  set setEtat(String? value) {
    etat = value;
  }

  int? get getAppariteurId => appariteurId;

  set setAppariteurId(int? value) {
    appariteurId = value;
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
  static Planning getDefaultPlanning() {
    return Planning(
      planningId: 1,
      date: DateTime.now(),
      heureDebutMatin: '08:00',
      heureFinMatin: '12:00',
      heureDebutSoir: '14:00',
      heureFinSoir: '18:00',
      etat: 'En cours',
      appariteurId: 1,
      deletedAt: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
