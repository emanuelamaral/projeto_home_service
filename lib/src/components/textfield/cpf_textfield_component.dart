import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfTextFieldComponent extends StatelessWidget {
  final TextEditingController textController;

  const CpfTextFieldComponent({super.key, required this.textController});

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
            hintText: '123.123.123-00',
            hintStyle: const TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          inputFormatters: [
            MaskTextInputFormatter(
              mask: '###.###.###-##',
              filter: {"#": RegExp(r'[0-9]')},
            ),
          ],
          keyboardType: TextInputType.number,
          validator: (value) => value == null || value.isEmpty
              ? 'Por favor, insira seu CPF'
              : null,
        ),
      ),
    );
  }
}
