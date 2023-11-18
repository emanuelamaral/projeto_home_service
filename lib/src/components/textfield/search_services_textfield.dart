import 'package:flutter/material.dart';

class SearchServiceTextField extends StatelessWidget {
  const SearchServiceTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(24, 177, 164, 164),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                hintText: 'Pesquise por um serviço',
                hintStyle: const TextStyle(fontFamily: 'Poppins'),
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)))),
      ),
    );
  }
}
