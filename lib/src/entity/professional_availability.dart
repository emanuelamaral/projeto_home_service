import 'package:flutter/material.dart';

import '../enum/days_of_week.dart'; // Certifique-se de que você importou o pacote correto

class ProfessionalAvailability {
  int? id;
  DaysOfWeek? dayOfWeek;
  List<TimeOfDay>? availableHours;

  ProfessionalAvailability({
    this.id,
    this.dayOfWeek,
    this.availableHours,
  });

  factory ProfessionalAvailability.fromJson(Map<String, dynamic> json) {
    return ProfessionalAvailability(
      id: json['id'],
      dayOfWeek: parseDaysOfWeek(json['dayOfWeek']),
      availableHours: (json['availableHours'] as List<dynamic>?)
          ?.map((time) => _parseTimeOfDay(time))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dayOfWeek': dayOfWeek?.toString().split('.').last,
      'availableHours':
          availableHours?.map((time) => _formatTimeOfDay(time)).toList(),
    };
  }

  static TimeOfDay _parseTimeOfDay(String time) {
    List<String> parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _formatTimeOfDay(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }
}
