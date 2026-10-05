import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String myText;
  final double fontSize;
  final Color myColor;

  const CustomText({
    super.key,
    required this.myText,
    this.fontSize = 20,
    this.myColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: TextStyle(
        fontSize: fontSize,
        color: myColor,
      ),
    );
  }
}