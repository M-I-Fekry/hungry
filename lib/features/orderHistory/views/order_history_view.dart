import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/cart/widgets/cart_item.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 15, bottom: 120),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/test/test.png', width: 100),

                        Column(
                          children: [
                            CustomText(
                              text: 'Hamburger',
                              weight: FontWeight.w600,
                            ),
                            CustomText(text: 'Veggie Burger'),
                            CustomText(text: 'Qty: x3'),
                            CustomText(text: 'price: 3\$'),
                          ],
                        ),
                      ],
                    ),

                    Gap(10),
                    CustomButton(
                      text: 'Order Again',
                      width: double.infinity,
                      height: 40,
                      size: 18,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
