import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Color? focusColor;
  final double? borderRadiusCircular;
  final Color? borderSideColor;
  final Color? fillColor;
  final bool? filled;
  final String label;
  final Widget? suffixIconButton;
  final String hint;
  final IconData prefixIcon;
  final isPassword;
  final bool? isObsecureText;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.controller,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.suffixIconButton,
    this.isPassword = false,
    this.isObsecureText = false,
    this.fillColor,
    this.filled,
    this.borderSideColor=Colors.grey,
    this.borderRadiusCircular=12, this.focusColor=Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      obscureText: isObsecureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusCircular!),
          borderSide: BorderSide(color: borderSideColor!),
        ),
        focusColor: focusColor,
        suffixIcon: isPassword ? suffixIconButton : null,
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusCircular!),
          borderSide: BorderSide(color: borderSideColor!),
        ),
      ),
    );
  }
}
