import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/widgets/checkout_bottom_sheet.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/widgets/topping_card.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
  final List<Map<String, String>> toppings = [
    {'title': 'Tomato', 'image': 'assets/toppings/Tomato.png'},
    {'title': 'Onions', 'image': 'assets/toppings/Onions.png'},
    {'title': 'Pickles', 'image': 'assets/toppings/Pickles.png'},
    {'title': 'Bacons', 'image': 'assets/toppings/Bacons.png'},
  ];

  final List<Map<String, String>> SideOptions = [
    {'title': 'Fries', 'image': 'assets/side_option/Fries.png'},
    {'title': 'Coleslaw', 'image': 'assets/side_option/Coleslaw.png'},
    {'title': 'Salad', 'image': 'assets/side_option/Salad.png'},
    {'title': 'Onion', 'image': 'assets/side_option/onion.png'},
  ];

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
              SpicySlider(
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                  print(value);
                },
              ),

              Gap(8),
              CustomText(text: 'Toppings', size: 20, weight: FontWeight.bold),

              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: toppings.length,
                  separatorBuilder: (context, index) => const Gap(15),
                  itemBuilder: (context, index) {
                    return ToppingCard(
                      title: toppings[index]['title']!,
                      imageUrl: toppings[index]['image']!,
                      onAdd: () {
                        print('${toppings[index]['title']} Added');
                      },
                    );
                  },
                ),
              ),

              Gap(20),
              CustomText(
                text: 'Side Options',
                size: 20,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: SideOptions.length,
                  separatorBuilder: (context, index) => const Gap(15),
                  itemBuilder: (context, index) {
                    return ToppingCard(
                      title: SideOptions[index]['title']!,
                      imageUrl: SideOptions[index]['image']!,
                      onAdd: () {
                        print('${SideOptions[index]['title']} Added');
                      },
                    );
                  },
                ),
              ),
              Gap(300),
            ],
          ),
        ),
      ),

      bottomSheet: CheckoutBottomSheet(
        title: 'Total',
        price: '\$20',
        buttonText: 'Add To Cart',
        onTap: () {
          print('Added to cart!'); 
        },
      ),
    );
  }
}
