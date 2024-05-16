import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final VoidCallback? onTap;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle; 
  final TextStyle? textStyle; 
  final BorderRadius?  borderRadius; // Thêm trường borderRadius

  const CustomTextField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.readOnly,
    this.onTap,
    this.obscureText = false,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.padding,
    this.hintStyle,
    this.textStyle,
    this.borderRadius, // Thêm trường borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly ?? false,
        onTap: onTap,
        obscureText: obscureText,
        textInputAction: textInputAction,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        style: textStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0), // Sử dụng giá trị mặc định là 10.0 nếu giá trị borderRadius là null
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0), // Sử dụng giá trị mặc định là 10.0 nếu giá trị borderRadius là null
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
