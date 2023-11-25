import 'package:flutter/material.dart';

class CardHomeService extends StatelessWidget {
  final IconData icon;
  final String textIcon;
  final VoidCallback? onPressed;

  const CardHomeService({
    Key? key,
    required this.icon,
    required this.textIcon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              elevation: 3.0,
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Icon(
                    icon,
                    size: 45.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            textIcon,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
