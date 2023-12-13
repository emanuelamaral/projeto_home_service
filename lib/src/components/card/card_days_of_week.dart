import 'package:flutter/material.dart';

class CardDaysOfWeek extends StatefulWidget {
  CardDaysOfWeek(
      {super.key,
      required this.dayView,
      required this.dayVerfify,
      required this.daysOfWeekAvailable,
      required this.onPressedButton});

  final String dayView;
  final String dayVerfify;
  final List<String> daysOfWeekAvailable;

  final VoidCallback onPressedButton;

  bool enable = false;

  @override
  State<CardDaysOfWeek> createState() => _CardDaysOfWeekState();
}

class _CardDaysOfWeekState extends State<CardDaysOfWeek> {
  @override
  void initState() {
    super.initState();
    verifyDaysCard();
  }

  verifyDaysCard() {
    for (int i = 0; i < widget.daysOfWeekAvailable.length; i++) {
      if (widget.daysOfWeekAvailable[i].contains(widget.dayVerfify)) {
        setState(() {
          widget.enable = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 70.0,
        height: 100,
        // elevation: 9.0,
        decoration: BoxDecoration(
            color: widget.enable ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
          onPressed: () {
            if (widget.enable) {
              widget.onPressedButton.call();
            }
          },
          child: Center(
              child: Text(
            widget.dayView,
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
