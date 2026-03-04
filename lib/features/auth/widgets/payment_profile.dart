import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/data/auth_model.dart';
import 'package:hungry_app/shared/custom_text.dart';

class PaymentProfile extends StatelessWidget {
  const PaymentProfile({super.key, this.userModel,});
  final UserModel? userModel; 


  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      tileColor: AppColors.primaryColor,
      leading: Image.asset('assets/icon/profileVisa.png', width: 50),
      title: CustomText(text: 'Debit Card', color: Colors.white),
      subtitle: CustomText(
        text:userModel?.visa?.toString()?? '8880 **** **** 8088',
        color: Colors.white,
      ),
      trailing: Radio<String>(
        activeColor: Colors.white,
        value: 'visa',
        groupValue: 'visa',
        onChanged: (value) => {},
      ),
      onTap: () {},
    );
  }
}
