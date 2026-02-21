import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/login_form.dart';
import 'package:hungry_app/shared/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            children: [
              const Gap(100),
              SvgPicture.asset('assets/logo/logo.svg', color: Colors.white),
              const Gap(10),
              const CustomText(
                text: 'Login to your account',
                color: Colors.white,
                size: 18,
                weight: FontWeight.w500,
              ),
              const Gap(60),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: const LoginForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
