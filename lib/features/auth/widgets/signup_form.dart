import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_btn.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailControlle = TextEditingController();
  final TextEditingController nameControlle = TextEditingController();
  final TextEditingController passControlle = TextEditingController();
  final TextEditingController confirmPassControlle = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() => isLoading = true);
        final user = await authRepo.signup(
          nameControlle.text.trim(),
          emailControlle.text.trim(),
          passControlle.text.trim(),
        );
        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => LoginView()),
          );
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errMsg = 'Error in Register';
        if (e is ApiError) {
          errMsg = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(customSnack(errMsg));
      }
    }
  }

  @override
  void dispose() {
    emailControlle.dispose();
    nameControlle.dispose();
    passControlle.dispose();
    confirmPassControlle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              controlle: nameControlle,
              hintText: 'Name',
              isPassword: false,
              fillColor: Colors.grey.shade200,
              borderColor: Colors.transparent,
            ),
            const Gap(15),
            CustomTextField(
              controlle: emailControlle,
              hintText: 'Email Address',
              isPassword: false,
              fillColor: Colors.grey.shade200,
              borderColor: Colors.transparent,
            ),
            const Gap(15),
            CustomTextField(
              controlle: passControlle,
              hintText: 'Password',
              isPassword: true,
              fillColor: Colors.grey.shade200,
              borderColor: Colors.transparent,
            ),
            const Gap(15),
            CustomTextField(
              controlle: confirmPassControlle,
              hintText: 'Confirm Password',
              isPassword: true,
              fillColor: Colors.grey.shade200,
              borderColor: Colors.transparent,
            ),
            const Gap(30),
            isLoading
                ? CupertinoActivityIndicator(color: Colors.black)
                : CustomAuthBtn(
                    onTap: signup,
                    text: 'Sign up',
                    btnColor: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
