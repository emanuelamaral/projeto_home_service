import 'package:projeto_home_service/src/api/api_config.dart';
import 'package:projeto_home_service/src/entity/user_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../auth/user_auth.dart';

class UserService {
  final String apiUrl = ApiConfig().api();
  final Map<String, String> headerMap = {"Content-Type": "application/json"};

  // Insert User
  Future<void> insertUser(UserEntity userEntity) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user'),
      body: json.encode(userEntity.toJson()),
      headers: headerMap,
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to insert User');
    }
  }

  // Get User
  Future<UserEntity> getUser(int userId) async {
    final response = await http.get(Uri.parse('$apiUrl/user/id=$userId'));

    if (response.statusCode == 200) {
      return UserEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<void> updateUser(UserEntity userEntity) async {
    final response = await http.put(
      Uri.parse('$apiUrl/id=${userEntity.userId}'),
      body: json.encode(userEntity.toJson()),
      headers: headerMap,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update User');
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$apiUrl/user/id=$userId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete User');
    }
  }

  Future<void> verifyAuthLogin(UserAuth userAuth) async {
    final response = await http.post(Uri.parse('$apiUrl/user/auth'),
        body: json.encode(userAuth.toJson()), headers: headerMap);

    if (response.body == "") {
      throw Exception('Failed to auth User');
    }
  }
}
