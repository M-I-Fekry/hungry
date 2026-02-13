import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_btn.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController emailControlle = TextEditingController();
  final TextEditingController nameControlle = TextEditingController();
  final TextEditingController passControlle = TextEditingController();
  final TextEditingController confirmPassControlle = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset('assets/logo/logo.svg'),
                Gap(10),
                Gap(60),
                CustomTextField(
                  controlle: nameControlle,
                  hintText: 'Name',
                  isPassword: false,
                ),
                Gap(15),
                CustomTextField(
                  controlle: emailControlle,
                  hintText: 'Email Address',
                  isPassword: false,
                ),
                Gap(15),
                CustomTextField(
                  controlle: passControlle,
                  hintText: 'Password',
                  isPassword: true,
                ),
                Gap(15),
                CustomTextField(
                  controlle: confirmPassControlle,
                  hintText: 'Confirm Password',
                  isPassword: true,
                ),
                Gap(30),
                CustomAuthBtn(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('success login');
                    }
                  },
                  text: 'Sign up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
