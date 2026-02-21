import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditProfileButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.drive_file_rename_outline_rounded,
          color: Colors.white,
          size: 22,
        ),
        label: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 18),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
