import 'package:fcl_baank/utills/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 180,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(27),
          color: Colors.green[200],
        ),
        child: Center(child: Text(text, style: AppTextStyles.button)),
      ),
    );
  }
}
