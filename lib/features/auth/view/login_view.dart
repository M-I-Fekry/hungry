import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailControlle = TextEditingController();
  TextEditingController passWordControlle = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,

        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset('assets/logo/logo.svg'),
                  Gap(10),
                  CustomText(
                    text: 'Hello,M_I_Fekry',
                    color: Colors.white,
                    size: 18,
                    weight: FontWeight.w500,
                  ),
                  Gap(60),
                  CustomTextField(
                    controlle: emailControlle,
                    hintText: 'Email Address',
                    isPassword: false,
                  ),
                  Gap(20),
                  CustomTextField(
                    controlle: passWordControlle,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  Gap(55),

                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print('success login');
                      }
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),

                      width: double.infinity,
                      child: Center(
                        child: CustomText(
                          text: 'login',
                          weight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
