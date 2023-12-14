import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';

class ProfessionalProvider extends ChangeNotifier {
  ProfessionalEntity? _professional;

  ProfessionalEntity get professional => _professional!;

  void setProfessional(ProfessionalEntity professional) {
    _professional = professional;
    notifyListeners();
  }

  void logout() {
    _professional = null;
    notifyListeners();
  }
}
