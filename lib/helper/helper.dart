import 'dart:convert';
import 'package:dio/dio.dart';

class ApiHelper {
  final String apiUrl = "https://appariteur.com/api/user/login.php";
  final Dio dio = Dio();

  Future<Map<String, dynamic>> loginUser( email, password) async {
      final response = await dio.post(apiUrl,
        data: {
          'emailUser': email,
          'passwordUser': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.data);
        final String token = responseData['token'];
        final Map<String, dynamic> userData = responseData['userData'];
        return {
          'token': token,
          'userData': userData,
        };
      } else {
        throw "Échec de la connexion. Le serveur a renvoyé le code d'état: ${response.statusCode}";
      }
    }
  }
