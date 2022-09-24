import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  const MyTextFeild(
      {Key? key,
      this.validator,
      this.onTap,
      this.textInputAction,
      this.prefixIcon,
      this.onChanged,
      this.decoration,
      this.inputType,
      this.obscureText = false,
      this.textColor=Colors.black,
      this.textSize=20,
      this.fillColor = Colors.white,
      this.controller,
      this.border,
      this.readOnly=false,
      this.maxLines = 1})
      : super(key: key);
  final Color? fillColor;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? inputType;
  final bool obscureText;
  final InputDecoration? decoration;
  final InputBorder? border;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final double? textSize;
  final Color? textColor;
  final bool  readOnly;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: inputType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: decoration,
      maxLines: maxLines,
      readOnly: readOnly,    

    );
  }
}
