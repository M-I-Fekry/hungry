import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/root.dart';

class ContinueGuestText extends StatelessWidget {
  const ContinueGuestText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Root()),
        );
      },
      child: Text(
        'Continue as a Guest',
        style: TextStyle(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
