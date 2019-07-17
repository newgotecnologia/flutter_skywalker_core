import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// https://stackoverflow.com/a/50650274
const _defaultInputBorder =
    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)));

void _defaultChangeCallback(String a, String b) {}

typedef TextChangeCallback(String masked, String raw);

class SkyTextField extends StatelessWidget {
  final bool obscureText;
  final bool deobscureTextIcon;

  final String label;
  final String mask;

  final Color labelColor;

  final Widget suffix;
  final Widget prefix;
  final Widget suffixIcon;
  final Widget prefixIcon;

  final TextInputType type;
  final TextAlign textAlign;
  final OutlineInputBorder inputBorder;
  final TextStyle style;
  final TextChangeCallback onChanged;

  const SkyTextField({
    Key key,
    this.label = "",
    this.type = TextInputType.text,
    this.obscureText = false,
    this.deobscureTextIcon = false,
    this.textAlign = TextAlign.start,
    this.inputBorder = _defaultInputBorder,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.mask,
    this.onChanged = _defaultChangeCallback,
    this.labelColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller;

    if (null != this.mask) {
      controller = MaskedTextController(mask: mask);
    }

    if (label != "") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
          ),
          FittedBox(
              fit: BoxFit.cover,
              child: PlatformTextField(
                obscureText: obscureText,
                controller: controller,
                android: (context) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    prefix: prefix,
                    suffix: suffix,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    border: inputBorder,
                  ),
                  style: style,
                ),
                ios: (context) => CupertinoTextFieldData(
                  prefix: prefix,
                  suffix: suffix,
                ),
              ))
        ],
      );
    } else {
      return FittedBox(
          fit: BoxFit.cover,
          child: PlatformTextField(
            obscureText: obscureText,
            controller: controller,
            android: (context) => MaterialTextFieldData(
              decoration: InputDecoration(
                prefix: prefix,
                suffix: suffix,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                border: inputBorder,
              ),
              style: style,
            ),
            ios: (context) => CupertinoTextFieldData(
              prefix: prefix,
              suffix: suffix,
            ),
          ));
    }
  }
}
