import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/card/card_days_of_week.dart';
import 'package:projeto_home_service/src/components/label/label_component.dart';
import 'package:projeto_home_service/src/entity/professional_availability.dart';
import 'package:projeto_home_service/src/entity/professional_entity.dart';
import 'package:projeto_home_service/src/list/days_of_week_list.dart';

import '../../components/ListView/list_view_hours_available.dart';

class ProfessionalChoose extends StatefulWidget {
  ProfessionalChoose({super.key, required this.professional});

  final ProfessionalEntity professional;
  final List<String>? daysOfWeekAvailable = [];
  final List<ProfessionalAvailability> availabilities = [];

  final List<TimeOfDay>? availableHours = [];

  @override
  State<ProfessionalChoose> createState() => _ProfessionalChooseState();
}

class _ProfessionalChooseState extends State<ProfessionalChoose> {
  @override
  void initState() {
    super.initState();
    verifyDaysAvailable();
  }

  verifyDaysAvailable() {
    widget.professional.availabilities?.forEach((element) {
      for (int i = 0; i < daysOfWeek.length; i++) {
        if (element.dayOfWeek.toString().contains(daysOfWeek[i])) {
          widget.daysOfWeekAvailable!.add(daysOfWeek[i]);
          widget.availabilities.add(element);
        }
      }
    });
  }

  getHoursAvailable(value) {
    for (int i = 0; i < widget.availabilities.length; i++) {
      if (widget.availabilities[i].dayOfWeek
          .toString()
          .contains(value.toString())) {
        widget.availableHours!
            .add(widget.availabilities[i].availableHours!.elementAt(i));
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 400,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(77, 141, 141, 141),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: 500,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelComponents(
                        textLabel: "Escolha um dia da semana", size: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardDaysOfWeek(
                            dayView: 'Seg',
                            dayVerfify: 'MONDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('MONDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Ter',
                            dayVerfify: 'TUESDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('TUESDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Qua',
                            dayVerfify: 'WEDNESDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('WEDNESDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Qui',
                            dayVerfify: 'THURSDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('THURSDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Sex',
                            dayVerfify: 'FRIDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('FRIDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Sáb',
                            dayVerfify: 'SATURDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('SATURDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Dom',
                            dayVerfify: 'SUNDAY',
                            daysOfWeekAvailable: widget.daysOfWeekAvailable!,
                            onPressedButton: () {
                              getHoursAvailable('SUNDAY');
                            },
                          ),
                        ],
                      ),
                    ),
                    const LabelComponents(
                      textLabel: "Escolha os horários disponíveis",
                      size: 20,
                    ),
                    Column(
                      children: widget.availableHours!.map((time) {
                        return ListTile(
                          title: Text("${time.hour}:${time.minute}"),
                          // Personalize conforme necessário
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
