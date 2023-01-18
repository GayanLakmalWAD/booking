import 'package:booking/core/utils/colors.dart';
import 'package:booking/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIconUrl;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    this.hintText = 'Write something...',
    this.controller,
    this.prefixIconUrl,
    this.textStyle,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: widget.textStyle,
      keyboardType: TextInputType.name,
      cursorColor: AppColors.kSecondaryColor,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        isDense: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: Dimensions.h3),
        prefixIcon: widget.prefixIconUrl,
      ),
    );
  }
}
