import 'package:flutter/material.dart';

class AvailableHoursList extends StatelessWidget {
  final List<TimeOfDay>? availableHours;

  AvailableHoursList({required this.availableHours});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: availableHours!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "${availableHours![index].hour}:${availableHours![index].minute}",
          ),
        );
      },
    );
  }
}
