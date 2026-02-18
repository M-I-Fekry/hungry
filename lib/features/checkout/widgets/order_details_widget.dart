import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/checkout/views/checkout_view.dart';
import 'package:hungry_app/shared/custom_text.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.texes,
    required this.fees,
    required this.total,
  });
  final String order, texes, fees, total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget('Order', order, false, false),
        Gap(10),
        checkoutWidget('Taxes', texes, false, false),
        Gap(10),
        checkoutWidget('Delivery fees', fees, false, false),
        Divider(),
        Gap(10),
        checkoutWidget('Total', total, true, false),
        Gap(10),
        checkoutWidget('Estimated delivery time:', '15 - 30 mins', true, true),
      ],
    );
  }
}

Widget checkoutWidget(title, price, isBold, isSmall) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        size: isSmall ? 14 : 18,
        weight: isBold ? FontWeight.bold : FontWeight.w500,
        color: isBold ? Colors.black : Colors.grey.shade600,
      ),
      CustomText(
        text: price,
        size: isSmall ? 14 : 18,
        weight: isBold ? FontWeight.bold : FontWeight.w500,
        color: isBold ? Colors.black : Colors.grey.shade600,
      ),
    ],
  );
}
