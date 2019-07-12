import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_skywalker_core/src/constants/dimen.dart';
import 'package:flutter_skywalker_core/src/widgets/sky_text.dart';

void _defaultCallback() {}

class SkyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final int maxLines;
  final double borderRadius;
  final Color textColor;
  final Color buttonColor;
  final FontWeight fontWeight;
  final Icon inlineIcon;
  final Icon upsideIcon;
  final Color borderColor;
  final double iconRightPadding;

  const SkyButton({
    Key key,
    this.onPressed = _defaultCallback,
    this.text = "",
    this.fontSize = 12,
    this.maxLines = 1,
    this.borderRadius = 0,
    this.textColor = Colors.black,
    this.buttonColor = Colors.blue,
    this.fontWeight = FontWeight.normal,
    this.borderColor = Colors.white,
    this.iconRightPadding = 5,
    this.inlineIcon,
    this.upsideIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (inlineIcon != null) {
      return PlatformButton(
        padding: EdgeInsets.symmetric(
          horizontal: Dimen.horizontal_padding,
          vertical: Dimen.vertical_padding,
        ),
        color: buttonColor,
        android: (context) {
          return MaterialRaisedButtonData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: iconRightPadding),
              child: FittedBox(
                fit: BoxFit.cover,
                child: inlineIcon,
              ),
            ),
            Container(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SkyText(
                  text,
                  fontSize: fontSize,
                  key: key,
                  maxLines: maxLines,
                  textColor: textColor,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      );
    } else if (upsideIcon != null) {
      return PlatformButton(
        padding: EdgeInsets.symmetric(
          horizontal: Dimen.horizontal_padding,
          vertical: Dimen.vertical_padding,
        ),
        color: buttonColor,
        android: (context) {
          return MaterialRaisedButtonData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FittedBox(
                fit: BoxFit.cover,
                child: upsideIcon,
              ),
            ),
            Container(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SkyText(
                  text,
                  fontSize: fontSize,
                  key: key,
                  maxLines: maxLines,
                  textColor: textColor,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      );
    } else {
      return PlatformButton(
        padding: EdgeInsets.symmetric(
          horizontal: Dimen.horizontal_padding,
          vertical: Dimen.vertical_padding,
        ),
        color: buttonColor,
        android: (context) {
          return MaterialRaisedButtonData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor),
            ),
          );
        },
        child: FittedBox(
          fit: BoxFit.cover,
          child: SkyText(
            text,
            fontSize: fontSize,
            key: key,
            maxLines: maxLines,
            textColor: textColor,
            fontWeight: fontWeight,
          ),
        ),
        onPressed: onPressed,
      );
    }
  }
}
