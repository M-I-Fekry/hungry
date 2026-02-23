import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/auth_switch_text.dart';
import 'package:hungry_app/features/auth/widgets/continue_guest_text.dart';
import 'package:hungry_app/features/auth/widgets/custom_btn.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailControlle = TextEditingController();
  final TextEditingController passWordControlle = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => isLoading = true);

    try {
      final user = await authRepo.login(
        emailControlle.text.trim(),
        passWordControlle.text.trim(),
      );
      if (user != null)
        Navigator.push(context, MaterialPageRoute(builder: (_) => Root()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnack(e is ApiError ? e.message : 'Unhandled login error'),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    emailControlle.dispose();
    passWordControlle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controlle: emailControlle,
              hintText: 'Email Address',
              isPassword: false,
              fillColor: Colors.grey.shade200,
              borderColor: Colors.transparent,
            ),
            const Gap(20),
            CustomTextField(
              controlle: passWordControlle,
              hintText: 'Password',
              isPassword: true,
              fillColor: Colors.grey.shade200,
              borderColor: Colors.transparent,
            ),
            const Gap(40),
            isLoading
                ? CupertinoActivityIndicator(color: Colors.black)
                : CustomAuthBtn(
                    onTap: login,
                    text: 'login',
                    btnColor: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
            const Gap(20),
            AuthSwitchText(
              text: "Don't have an account? ",
              actionText: "Sign Up",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return SignupView();
                    },
                  ),
                );
              },
            ),
            const Gap(15),
            ContinueGuestText(),
          ],
        ),
      ),
    );
  }
}
