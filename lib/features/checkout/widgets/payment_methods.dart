import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class PaymentMethods extends StatelessWidget {
  final String selectedMethod;
  final ValueChanged<String> onChanged;

  const PaymentMethods({
    super.key,
    required this.selectedMethod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 16,
          ),
          tileColor: const Color(0xFF1E3A8A),
          leading: Image.asset('assets/icon/cash.png', width: 50),
          title: CustomText(text: 'Cash on Delivery', color: Colors.white),
          trailing: Radio<String>(
            activeColor: Colors.white,
            value: 'cash',
            groupValue: selectedMethod,
            onChanged: (value) => onChanged(value!),
          ),
          onTap: () => onChanged('cash'),
        ),
        const Gap(20),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 16,
          ),
          tileColor: AppColors.primaryColor,
          leading: Image.asset('assets/icon/profileVisa.png', width: 50),
          title: CustomText(text: 'Debit Card', color: Colors.white),
          subtitle: CustomText(
            text: '8880 **** **** 8088',
            color: Colors.white,
          ),
          trailing: Radio<String>(
            activeColor: Colors.white,
            value: 'visa',
            groupValue: selectedMethod,
            onChanged: (value) => onChanged(value!),
          ),
          onTap: () => onChanged('visa'),
        ),
        const Gap(5),
        Row(
          children: [
            Checkbox(
              activeColor: Colors.red,
              value: true,
              onChanged: (value) {},
            ),
            CustomText(
              text: 'Save card details for future payments',
              size: 16,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ],
    );
  }
}
