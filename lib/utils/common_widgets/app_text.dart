import 'dart:ffi';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextStyle? style;
  final double? fontSize;

  const AppText({
    super.key,
    required this.text,
    this.textAlign,
    this.textColor,
    this.style,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.labelMedium;
    return Text(
      text,
      textAlign: textAlign,
      style:
          style ??
          defaultStyle?.copyWith(
            color: textColor ?? defaultStyle.color,
            fontSize: fontSize ?? defaultStyle.fontSize,
          ),
    );
  }
}
