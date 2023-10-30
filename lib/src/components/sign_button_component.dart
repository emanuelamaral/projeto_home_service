import 'package:flutter/material.dart';

class SignButtonComponent extends StatelessWidget {
  final String text;
  final bool login;

  const SignButtonComponent(
      {super.key, required this.text, required this.login});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 193, 42, 223)),
      child: TextButton(
          onPressed: () {
            login ? () {} : null;
          },
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
