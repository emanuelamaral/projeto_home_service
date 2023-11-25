class ProfessionalEntity {
  int? professionalId;
  final String? name;
  final String? profession;
  final String? description;
  final double? pricePerHour;
  final List<dynamic>? avaliations;
  final int? jobsPerformeds;

  ProfessionalEntity({
    this.professionalId,
    required this.name,
    required this.profession,
    required this.description,
    required this.pricePerHour,
    required this.avaliations,
    required this.jobsPerformeds,
  });

  factory ProfessionalEntity.fromJson(Map<String, dynamic> json) {
    return ProfessionalEntity(
      professionalId: json['ProfessionalId'],
      name: json['name'],
      profession: capitalizeAndTranslateProfession(json['profession']),
      description: json['description'],
      pricePerHour: json['pricePerHour'],
      avaliations: json['avaliations'],
      jobsPerformeds: json['jobsPerformeds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'professionalId': professionalId,
      'name': name,
      'profession': profession,
      'description': description,
      'pricePerHour': pricePerHour,
      'avaliations': avaliations,
      'jobsPerformeds': jobsPerformeds,
    };
  }

  static String capitalizeAndTranslateProfession(String? profession) {
    Map<String, String> professionTranslations = {
      'PAINTER': 'Pintor',
      'ELETRICIAN': 'Eletricista',
      'PLUMBER': 'Encanador',
      'CARPENTER': 'Carpinteiro',
      'PEST_CONTROLLER': 'Controle de Peste',
      'HOME_CLEANER': 'Limpador doméstico',
      'Jardineiro': 'Jardineiro',
    };

    return professionTranslations.containsKey(profession)
        ? professionTranslations[profession]!
        : profession?.capitalizeFirstLetter() ?? '';
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
