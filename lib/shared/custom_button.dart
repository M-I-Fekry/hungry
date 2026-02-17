import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.width,
    required this.height,
    required this.size, 
    this.color,
  });
  final String text;
  final double width;
  final double height;
  final double size;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color:color?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            size: size,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
