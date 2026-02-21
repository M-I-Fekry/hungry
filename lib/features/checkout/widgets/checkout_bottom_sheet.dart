import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final String title;
  final String price;
  final String buttonText;
  final VoidCallback onTap;
  final double sheetHeight;
  final Color? btnColor;

  const CheckoutBottomSheet({
    super.key,
    required this.title,
    required this.price,
    required this.buttonText,
    required this.onTap,
    this.sheetHeight = 120,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 15,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: sheetHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: title, size: 20, color: Colors.grey.shade600),
                CustomText(text: price, size: 24, weight: FontWeight.bold),
              ],
            ),
            const Spacer(),
            CustomButton(
              width: 180,
              height: 55,
              size: 18,
              text: buttonText,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
