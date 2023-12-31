import 'package:flutter/material.dart';

class CheckBoxComponent extends StatelessWidget {
  const CheckBoxComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheckboxExample();
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.purple,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text(
          'Lembrar de mim',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
