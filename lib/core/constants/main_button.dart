import 'package:flutter/material.dart';

import 'app_colors.dart';

enum ButtonType {
  primary,
  secondary,
}

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
  });
  final String text;
  final VoidCallback? onPressed;
  final ButtonType? type;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: type == ButtonType.primary
              ? AppColors.primaryBlue
              : AppColors.lightBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: type == ButtonType.primary
                ? Colors.transparent
                : AppColors.primaryBlue,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: type == ButtonType.primary
                  ? Colors.white
                  : AppColors.primaryBlue,
              fontFamily: 'SF Pro Display',
            ),
          ),
        ),
      ),
    );
  }
}
