import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController txtController;
  final bool isPassword; // 1. Tambahkan variabel ini

  const CustomTextField({
    super.key,
    required this.hint,
    required this.txtController,
    this.isPassword = false, // 2. Tambahkan parameter opsional ini (default false)
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: isPassword, // 3. Gunakan isPassword di obscureText
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}