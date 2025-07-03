import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;

  const AppText({super.key, required this.text, this.textAlign , this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign, style: TextStyle(color: textColor));
  }
}
