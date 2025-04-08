import 'package:fixit_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;
  const TitleSection({
    super.key,
    required this.title,
    this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xff565656),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              subtitle ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColor.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
