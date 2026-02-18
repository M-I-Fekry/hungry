import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 15,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primaryColor,
                  child: Image.asset('assets/icon/check_icon.png', width: 40),
                ),
              ),
              CustomText(text: 'Success !', size: 30),
              const Gap(10),
              Center(
                child: CustomText(
                  text:
                      'Your payment was successful.\nA receipt for this purchase has \n   been sent to your email.',
                  size: 14,
                  color: Colors.grey.shade500,
                ),
              ),
              const Gap(40),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Go Back',
                width: 220,
                height: 60,
                size: 18,
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
    );
  }
}
