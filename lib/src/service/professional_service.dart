import 'package:projeto_home_service/src/api/api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projeto_home_service/src/entity/professional_entity.dart';

class ProfessionalService {
  final String apiUrl = ApiConfig().api();
  final Map<String, String> headerMap = {"Content-Type": "application/json"};

  Future<List<ProfessionalEntity>> getProfessionalsByProfession(
      String profession) async {
    final response = await http
        .get(Uri.parse('$apiUrl/professional/profession=$profession'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<ProfessionalEntity> professionalsList = jsonList
          .map((jsonItem) => ProfessionalEntity.fromJson(jsonItem))
          .toList();
      return professionalsList;
    } else {
      throw Exception('Failed to load professionals');
    }
  }
}
