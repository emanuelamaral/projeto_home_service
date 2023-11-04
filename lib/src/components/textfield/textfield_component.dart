import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final bool password;
  final bool email;
  final String hintText;
  final TextEditingController? textController;

  const TextFieldComponent(
      {super.key,
      required this.password,
      required this.email,
      required this.hintText,
      required this.textController});

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: widget.textController,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
              ),
              suffixIcon: widget.password
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )
                  : null),
          keyboardType: widget.email ? TextInputType.emailAddress : null,
          obscureText: widget.password ? !passwordVisible : false,
        ),
      ),
    );
  }
}
