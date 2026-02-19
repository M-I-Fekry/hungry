import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/widgets/checkout_bottom_sheet.dart';
import 'package:hungry_app/features/checkout/widgets/order_details_widget.dart';
import 'package:hungry_app/features/checkout/widgets/payment_methods.dart';
import 'package:hungry_app/features/checkout/widgets/success_dailog.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = 'cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Order summary',
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(10),
              OrderDetailsWidget(
                order: '18\$',
                texes: '0.5\$',
                fees: '1.5\$',
                total: '20\$',
              ),
              Gap(120),
              CustomText(
                text: 'Payment methods',
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(10),
              PaymentMethods(
                selectedMethod: selectedMethod,
                onChanged: (value) => setState(() => selectedMethod = value),
              ),
            ],
          ),
        ),
      ),

      bottomSheet: CheckoutBottomSheet(
        title: 'Total price',
        price: '\$20',
        buttonText: 'Pay Now',
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SuccessDialog(),
          );
        },
      ),
    );
  }
}
