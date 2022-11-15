import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationTextFormFieldWidget extends StatelessWidget {
  final Function(String text)? onChanged;
  final Function(String? text)? onSaved;
  final String? Function(String? text)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? textStyle;
  final Color? borderSideColor;
  final Color? labelColor;
  final Color? hoverColor;
  final Color? borderColor;
  final bool readOnly;
  final bool isPassword;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? onlyFloatingLabelBehavior;
  final String? initialValue;
  final FocusNode? focusnode;
  final EdgeInsetsGeometry? padding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const ApplicationTextFormFieldWidget({
    Key? key,
    this.controller,
    this.onlyFloatingLabelBehavior = true,
    this.initialValue,
    this.focusnode,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.textStyle,
    this.readOnly = false,
    this.isPassword = false,
    this.borderSideColor,
    this.labelColor,
    this.borderColor,
    this.hoverColor,
    this.suffixIcon,
    this.padding,
    this.border,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          // hintColor: labelColor,
          // primarySwatch: Colors.red,
          ),
      child: Padding(
        padding: padding ?? EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          focusNode: focusnode,
          readOnly: readOnly,
          onChanged: onChanged,
          validator: validator,
          obscureText: isPassword,
          onSaved: onSaved,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted ?? (value) {},
          inputFormatters: inputFormatters,
          style: textStyle ??
              TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
          decoration: InputDecoration(
            focusedBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: borderColor ?? Colors.white,
                  ),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: borderColor ?? Colors.white,
                  ),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: borderColor ?? Colors.white,
                  ),
                ),
            floatingLabelBehavior:
                (onlyFloatingLabelBehavior == false) ? FloatingLabelBehavior.never : FloatingLabelBehavior.always,
            hoverColor: hoverColor ?? Colors.white,
            hintText: hintText ?? '',
            hintStyle: hintStyle ??
                TextStyle(
                  color: Colors.grey[400],
                  fontSize: 20,
                ),
            labelText: labelText ?? '',
            floatingLabelStyle: TextStyle(
              color: Colors.white,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
