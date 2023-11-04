import 'package:projeto_home_service/src/api/api_config.dart';
import 'package:projeto_home_service/src/entity/user_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  final String apiUrl = ApiConfig().api();

  // Insert User
  Future<void> insertUser(UserEntity userEntity) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user'),
      body: json.encode(userEntity.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to insert User');
    }
  }

  // Get User
  Future<UserEntity> getUser(int userId) async {
    final response = await http.get(Uri.parse('$apiUrl/$userId'));

    if (response.statusCode == 200) {
      return UserEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<void> updateUser(UserEntity userEntity) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${userEntity.userId}'),
      body: json.encode(userEntity.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to update User');
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$apiUrl/user/$userId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete User');
    }
  }
}
