import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool onlyNumbers;
  final TextInputType? keyboardType;
  final bool? isEditable;
  final int? lines;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.label,
      this.validator,
      this.obscureText = false,
      this.onlyNumbers = false,
      this.keyboardType,
      this.isEditable,
      this.lines});

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatters = [];

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6B2C7F)),
        ),
        fillColor: const Color(0xFFEeeeee),
        filled: true,
        hintText: hint,
        labelText: label,
        enabled: isEditable ?? true,
      ),
      maxLines: lines ?? 1,
      validator: validator ??
          (value) {
            return null;
          },
    );
  }
}
