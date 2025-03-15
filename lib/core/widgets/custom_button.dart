import 'package:flutter/material.dart';

Widget customButton({
  required String title,
  required VoidCallback onTap,
  required Color color,
  required Color textColor,
  double textSize = 16,
  Color? borderColor,
  double size = 50,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: size,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor ?? Colors.transparent, width: 2),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
