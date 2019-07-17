import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SkyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final int maxLines;
  final Color textColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const SkyText(
    this.text, {
    Key key,
    this.fontSize = 15,
    this.maxLines,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
