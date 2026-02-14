import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/features/home/widgets/food_category.dart';
import 'package:hungry_app/features/home/widgets/search_field.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';
import 'package:hungry_app/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ["All", "Combos", "Sliders", "Classic"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //header
            SliverAppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 180,
              elevation: 0,
              pinned: true,
              floating: false,
              automaticallyImplyActions: false,
              scrolledUnderElevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 70, right: 20, left: 10),
                child: Column(children: [UserHeader(), Gap(18), SearchField()]),
              ),
            ),

            // Category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FoodCategory(
                  selectedIndex: selectedIndex,
                  category: category,
                ),
              ),
            ),

            //GridView
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => CardItem(
                    image: 'assets/test/test.png',
                    text: 'Cheeseburger',
                    desc: 'Wendy"s Burger',
                    rate: '4.9',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
