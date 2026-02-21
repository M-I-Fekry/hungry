import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry_app/features/auth/widgets/edit_profile_button.dart';
import 'package:hungry_app/features/auth/widgets/logout_button.dart';
import 'package:hungry_app/features/auth/widgets/payment_profile.dart';
import 'package:hungry_app/features/auth/widgets/profile_header.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  void initState() {
    _name.text = 'Mohamed Fekry';
    _email.text = 'Fekry@gmail.com';
    _address.text = 'Cairo, Egypt';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [ProfileHeader(innerBoxIsScrolled: innerBoxIsScrolled)];
          },

          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(50),
                CustomUserTextField(controller: _name, label: 'Name'),
                const Gap(20),
                CustomUserTextField(controller: _email, label: 'Email'),
                const Gap(20),
                CustomUserTextField(controller: _address, label: 'Address'),
                const Gap(20),
                const Divider(thickness: 1),
                const Gap(10),
                const PaymentProfile(),
                const Gap(30),

                Row(
                  children: [
                    EditProfileButton(onPressed: () {}),
                    const Gap(12),
                    LogoutButton(onPressed: () {}),
                  ],
                ),
                const Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
