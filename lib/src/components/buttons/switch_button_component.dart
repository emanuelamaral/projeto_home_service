import 'package:flutter/material.dart';

class SwitchButtonComponenet extends StatefulWidget {
  const SwitchButtonComponenet({super.key});

  @override
  State<SwitchButtonComponenet> createState() => _SwitchButtonComponenetState();
}

class _SwitchButtonComponenetState extends State<SwitchButtonComponenet> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.purple,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
