import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          suffixIcon: suffixIcon,
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.black26,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: focusedBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColor.borderColor,
        width: 3,
      ),
      
    );
  }
    OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          );
  }
}
