import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void _defaultCallback() {}

class SkyTextButton extends StatelessWidget {
  final Key widgetKey;

  final String text;
  final VoidCallback onPressed;

  final Color backgroundColor;
  final Color textColor;

  final double borderRadius;
  final double padding;
  final double fontSize;

  final bool disabled;
  final bool fullWidth;

  SkyTextButton(
    this.text, {
    Key key,
    this.onPressed = _defaultCallback,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
    this.borderRadius = 4,
    this.fontSize = 12,
    this.disabled = false,
    this.fullWidth = true,
    this.padding = 16,
    this.widgetKey,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius =
        BorderRadius.all(Radius.circular(this.borderRadius));

    Text textWidget = Text(
      this.text,
      style: TextStyle(fontSize: this.fontSize),
    );

    Widget child = textWidget;

    if (this.fullWidth) {
      child = Container(
        width: double.infinity,
        child: Center(
          child: textWidget,
        ),
      );
    }

    return PlatformButton(
      key: key,
      widgetKey: widgetKey,
      child: child,
      onPressed: onPressed,
      color: backgroundColor,
      padding: EdgeInsets.all(padding),
      androidFlat: (context) => MaterialFlatButtonData(
        textColor: textColor,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      ios: (context) => CupertinoButtonData(
        borderRadius: borderRadius,
      ),
    );
  }
}
