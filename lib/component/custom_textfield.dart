import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  // variabel yang diperlukan
  final String myHint;
  final TextEditingController txtController;
  final Color textColor;
  final bool isNumeric;
  final bool isPassword;
  final IconData? icon;

  const CustomTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.textColor = Colors.grey,
    this.isNumeric = false,
    this.isPassword = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: isPassword,
      keyboardType: isNumeric
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      inputFormatters: isNumeric
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
          : null,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      cursorColor: Colors.redAccent,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        hintText: myHint,
        hintStyle: const TextStyle(color: Color(0xFFA0A0A0)),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: const Color(0xFFFF5252),
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent.withOpacity(0.3), width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}