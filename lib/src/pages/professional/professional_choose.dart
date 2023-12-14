import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/components/card/card_days_of_week.dart';
import 'package:projeto_home_service/src/components/label/label_component.dart';
import 'package:projeto_home_service/src/entity/professional_availability.dart';
import 'package:projeto_home_service/src/list/days_of_week_list.dart';
import 'package:projeto_home_service/src/provider/professional_provider.dart';
import 'package:provider/provider.dart';

class ProfessionalChoose extends StatelessWidget {
  const ProfessionalChoose({super.key});

  @override
  Widget build(BuildContext context) {
    final professionalProvider = Provider.of<ProfessionalProvider>(context);
    final professional = professionalProvider.professional;

    final List<String> daysOfWeekAvailable = [];
    final List<ProfessionalAvailability> availabilities = [];
    final List<TimeOfDay> availableHours = [];

    void verifyDaysAvailable() {
      professional.availabilities?.forEach((element) {
        for (int i = 0; i < daysOfWeek.length; i++) {
          if (element.dayOfWeek.toString().contains(daysOfWeek[i])) {
            daysOfWeekAvailable.add(daysOfWeek[i]);
            availabilities.add(element);
          }
        }
      });
    }

    void getHoursAvailable(value) {
      for (int i = 0; i < availabilities.length; i++) {
        if (availabilities[i].dayOfWeek.toString().contains(value.toString())) {
          availableHours.add(availabilities[i].availableHours!.elementAt(i));
        }
      }
    }

    verifyDaysAvailable();

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
                            daysOfWeekAvailable: daysOfWeekAvailable,
                            onPressedButton: () {
                              getHoursAvailable('MONDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Ter',
                            dayVerfify: 'TUESDAY',
                            daysOfWeekAvailable: daysOfWeekAvailable,
                            onPressedButton: () {
                              getHoursAvailable('TUESDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Qua',
                            dayVerfify: 'WEDNESDAY',
                            daysOfWeekAvailable: daysOfWeekAvailable,
                            onPressedButton: () {
                              getHoursAvailable('WEDNESDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Qui',
                            dayVerfify: 'THURSDAY',
                            daysOfWeekAvailable: daysOfWeekAvailable,
                            onPressedButton: () {
                              getHoursAvailable('THURSDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Sex',
                            dayVerfify: 'FRIDAY',
                            daysOfWeekAvailable: daysOfWeekAvailable,
                            onPressedButton: () {
                              getHoursAvailable('FRIDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Sáb',
                            dayVerfify: 'SATURDAY',
                            daysOfWeekAvailable: daysOfWeekAvailable,
                            onPressedButton: () {
                              getHoursAvailable('SATURDAY');
                            },
                          ),
                          CardDaysOfWeek(
                            dayView: 'Dom',
                            dayVerfify: 'SUNDAY',
                            daysOfWeekAvailable: daysOfWeekAvailable,
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
                      children: availableHours.map((time) {
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
