import 'address_entity.dart';
import 'professional_availability.dart';

class ProfessionalEntity {
  int? professionalId;
  String? name;
  String? profession;
  String? description;
  double? pricePerHour;
  List<dynamic>? avaliations;
  int? jobsPerformeds;
  AddressEntity? address;
  String? profileImagePath;
  List<ProfessionalAvailability>? availabilities;

  ProfessionalEntity({
    this.professionalId,
    this.name,
    this.profession,
    this.description,
    this.pricePerHour,
    this.avaliations,
    this.jobsPerformeds,
    this.address,
    this.profileImagePath,
    this.availabilities,
  });

  factory ProfessionalEntity.fromJson(Map<String, dynamic> json) {
    return ProfessionalEntity(
      professionalId: json['professionalId'],
      name: json['name'],
      profession: json['profession'],
      description: json['description'],
      pricePerHour: json['pricePerHour'],
      avaliations: json['avaliations'],
      jobsPerformeds: json['jobsPerformeds'],
      address: AddressEntity.fromJson(json['address'] ?? {}),
      profileImagePath: json['profileImagePath'],
      availabilities: (json['availabilities'] as List<dynamic>?)
          ?.map(
              (availability) => ProfessionalAvailability.fromJson(availability))
          .toList(),
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
      'address': address?.toJson(),
      'profileImagePath': profileImagePath,
      'availabilities':
          availabilities?.map((availability) => availability.toJson()).toList(),
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
