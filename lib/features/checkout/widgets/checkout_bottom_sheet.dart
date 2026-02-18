import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/checkout/widgets/success_dailog.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16),
                CustomText(
                  text: 'Total price',
                  size: 24,
                  color: Colors.grey.shade600,
                ),
                CustomText(text: '\$20', size: 26, weight: FontWeight.bold),
              ],
            ),
            const Spacer(),
            CustomButton(
              width: 180,
              height: 55,
              size: 20,
              text: 'Pay Now',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const SuccessDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
