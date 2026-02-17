import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/cart/widgets/cart_item.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 20;
  late List<int> quantities;
  @override
  void initState() {
    quantities = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  void onAdd(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMinus(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

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
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return CartItem(
              image: 'assets/test/test.png',
              text: 'Hamburger',
              desc: 'Veggie Burger',
              number: quantities[index],
              onAdd: () => onAdd(index),
              onMinus: () => onMinus(index),
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomText(
              text: '  Total\n  \$18.9',
              size: 28,
              weight: FontWeight.bold,
            ),
            const Spacer(),
            CustomButton(
              width: 175,
              height: 60,
              size: 20,
              text: 'Checkout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
