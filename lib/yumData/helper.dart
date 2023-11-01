import 'dart:convert';

import 'package:http/http.dart' as http;

class DatabaseHelper {
  // L'URL de votre serveur PHP qui interagit avec la base de données
  final String baseUrl = 'localhost:3000/';

  Future<List<Map<String, dynamic>>> fetchDataFromDatabase() async {
    final response = await http.get(Uri.parse('${baseUrl}fetch_data.php'));

    if (response.statusCode == 200) {
      // Analysez la réponse JSON ici
      // Exemple de JSON : [{"id": 1, "nom": "John"}, {"id": 2, "nom": "Jane"}]
      // Utilisez la classe jsonDecode pour analyser la réponse
      final List<Map<String, dynamic>> data = jsonDecode(response.body);
      return data;
    } else {
      // Gérez les erreurs ici
      throw Exception('Impossible de récupérer les données de la base de données.');
    }
  }
// Ajoutez d'autres méthodes pour insérer, mettre à jour ou supprimer des données dans la base de données
}
