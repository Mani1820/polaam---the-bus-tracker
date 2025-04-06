import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_colors.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
    this.obscuredText = false,
  });

  final String text;
  final TextEditingController controller;
  final bool obscuredText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: size.height * 0.07,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: AppColors.darkSecondaryText.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscuredText,
            cursorColor: AppColors.primaryBlue,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: text,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 93, 93, 93),
                fontFamily: 'SF Pro Display',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
