import 'package:flutter/material.dart';

class CustomButtonHome extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final double textSize;
  final Color? borderColor;
  final double size;
  final double withSize;

  const CustomButtonHome({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.textColor,
    this.textSize = 16,
    this.borderColor,
    this.size = 50,
    this.withSize = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: withSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 2,
          ),
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
}
