import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controlle,
    this.fillColor = Colors.white,
    this.borderColor = Colors.white,
  });

  final String hintText;
  final bool isPassword;
  final TextEditingController controlle;
  final Color fillColor;
  final Color borderColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'please fill ${widget.hintText}';
        }
        return null;
      },
      controller: widget.controlle,
      obscureText: _obscureText,
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(
                  _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: Colors.grey,
                ),
              )
            : null,
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
