import 'package:flutter/material.dart';

import '../../entity/professional_availability.dart';
import '../card/card_days_of_week.dart';

class ProfessionalListCardDaysOfWeek extends StatelessWidget {
  ProfessionalListCardDaysOfWeek({
    super.key,
    required this.daysOfWeekAvailable,
    required this.availabilities,
    required this.onGetHours,
  });

  final List<String> daysOfWeekAvailable;
  final List<ProfessionalAvailability> availabilities;
  final List<dynamic> availableHours = [];

  final VoidCallback onGetHours;

  getHoursAvailable(value) {
    for (int i = 0; i < availabilities.length; i++) {
      if (availabilities[i].dayOfWeek.toString().contains(value.toString())) {
        availableHours.add(availabilities[i].availableHours);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardDaysOfWeek(
          dayView: 'Seg',
          dayVerfify: 'MONDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("MONDAY");
          },
        ),
        CardDaysOfWeek(
          dayView: 'Ter',
          dayVerfify: 'TUESDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("TUESDAY");
          },
        ),
        CardDaysOfWeek(
          dayView: 'Qua',
          dayVerfify: 'WEDNESDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("WEDNESDAY");
          },
        ),
        CardDaysOfWeek(
          dayView: 'Qui',
          dayVerfify: 'THURSDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("THURSDAY");
          },
        ),
        CardDaysOfWeek(
          dayView: 'Sex',
          dayVerfify: 'FRIDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("FRIDAY");
          },
        ),
        CardDaysOfWeek(
          dayView: 'Sáb',
          dayVerfify: 'SATURDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("SATURDAY");
          },
        ),
        CardDaysOfWeek(
          dayView: 'Dom',
          dayVerfify: 'SUNDAY',
          daysOfWeekAvailable: daysOfWeekAvailable,
          onPressedButton: () {
            getHoursAvailable("SUNDAY");
          },
        ),
      ],
    );
  }
}
