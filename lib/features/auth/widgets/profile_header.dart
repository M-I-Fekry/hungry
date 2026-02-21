import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const ProfileHeader({super.key, required this.innerBoxIsScrolled});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      backgroundColor: AppColors.primaryColor,
      elevation: innerBoxIsScrolled ? 4 : 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
      ),
      title: const Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.white)),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage('https://image.tmdb.org/t/p/original/rRLQRYOkAPKqs2mL4IYKdntwUgr.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}