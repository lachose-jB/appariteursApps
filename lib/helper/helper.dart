import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../acteursClass/userDfault.dart';
class ApiHelper {
  final String baseUrl = "https://appariteur.com/api/user/login.php";
  final Dio dio = Dio();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
//Future<Map<String, dynamic>> loginUser(email,password) async
  Future<String> loginUser(email,password) async {
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
      rethrow;
    }
  }

  Future<String?> getToken() async {

    return await storage.read(key: 'token');
  }
}
