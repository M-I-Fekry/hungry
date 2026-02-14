import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.rate,
  });

  final String image, text, desc, rate;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey.shade700,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 150),
                Gap(10),
                CustomText(text: text, weight: FontWeight.bold),
                CustomText(text: desc),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.star,
                      size: 15,
                      color: Color(0xffFF9633),
                    ),
                    CustomText(text: rate),
                    Spacer(),
                    Icon(CupertinoIcons.heart),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
