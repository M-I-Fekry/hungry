import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_model.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry_app/features/auth/widgets/edit_profile_button.dart';
import 'package:hungry_app/features/auth/widgets/logout_button.dart';
import 'package:hungry_app/features/auth/widgets/payment_profile.dart';
import 'package:hungry_app/features/auth/widgets/profile_header.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _visa = TextEditingController();
  UserModel? userModel;
  AuthRepo authRepo = AuthRepo();

  /// get profile
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
      });
    } catch (e) {
      String errorMsg = 'Error in Profile';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
    }
  }

  @override
  void initState() {
    getProfileData().then((v) {
      _name.text = (userModel?.name == null || userModel?.name == 'null')
          ? 'Mohamed Fekry'
          : userModel!.name!;

      _email.text = (userModel?.email == null || userModel?.email == 'null')
          ? 'Fekry@gmail.com'
          : userModel!.email!;

      _address.text =
          (userModel?.adsress == null || userModel?.adsress == 'null')
          ? 'Cairo, Egypt'
          : userModel!.adsress!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await getProfileData();
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),

        child: Skeletonizer(
          enabled: userModel == null,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  ProfileHeader(
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    userModel: userModel,
                  ),
                ];
              },

              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Gap(30),
                    CustomUserTextField(controller: _name, label: 'Name'),
                    const Gap(20),
                    CustomUserTextField(controller: _email, label: 'Email'),
                    const Gap(20),
                    CustomUserTextField(controller: _address, label: 'Address'),
                    const Gap(20),
                    const Divider(thickness: 1),
                    const Gap(10),
                    (userModel?.visa == null ||
                            userModel?.visa == 'null' ||
                            userModel?.visa.toString().trim().isEmpty == true)
                        ? CustomUserTextField(
                            controller: _visa,
                            textInputType: TextInputType.number,
                            label: '**** Add Visa Card ****',
                          )
                        : PaymentProfile(userModel: userModel),
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
        ),
      ),
    );
  }
}
