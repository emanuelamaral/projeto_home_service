import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField(
      {super.key, required this.hintText, this.textController});

  final String hintText;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textController,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
