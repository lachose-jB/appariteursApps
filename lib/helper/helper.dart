import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../acteursClass/userDfault.dart';

class ApiHelper {
  final String baseUrl = "https://appariw.cluster024.hosting.ovh.net/ap/api/user/login.php";
  final Dio dio = Dio();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await dio.post(baseUrl,
        data: json.encode({
          "passwordUser": password,
          "emailUser": email
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      final responseData = json.decode(response.data);
      await storage.write(key: 'token', value: responseData['token']);
      return responseData;
    } catch (error) {
      throw error;
    }
  }
  Future<UserModel> getUserInfo() async {
    final token = await storage.read(key: 'token');
    try {
      final response = await dio.get(baseUrl, options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      final responseData = json.decode(response.data);
      return UserModel.fromJson(responseData['userData']);
    } catch (error) {
      throw error;
    }
  }

  Future<String?> getToken() async {

    return await storage.read(key: 'token');
  }
}
