import 'package:flutter/material.dart';
import 'package:flutter_skywalker_core/src/widgets/sky_text.dart';

class SkyFlatButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double fontSize;
  final int maxLines;
  final Color textColor;

  const SkyFlatButton({
    Key key,
    this.onPressed,
    this.text,
    this.fontSize,
    this.maxLines,
    this.textColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: SkyText(
        text,
        fontSize: fontSize,
        textColor: textColor,
      ),
      onPressed: onPressed,
    );
  }
}
