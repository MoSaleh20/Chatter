import 'package:flutter/material.dart';

Widget customBarTap(String text, bool picked) {
  Color containerColor = Colors.transparent;
  Color textColor = Colors.white;

  if (picked) {
    containerColor = Colors.white;
    textColor = const Color.fromARGB(255, 149, 109, 224);
  }
  return GestureDetector(
    onTap: () {
      picked = true;
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(100)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          decoration: TextDecoration.none,
          color: textColor,
        ),
      ),
    ),
  );
}
