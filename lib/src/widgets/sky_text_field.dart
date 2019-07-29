import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void _defaultChangeCallback(String a) {}

typedef TextChangeCallback(String raw);

class SkyTextField extends StatelessWidget {
  final int maxLines;

  final bool obscureText;
  final bool deobscureTextIcon;

  final double verticalContentPadding;
  final double horizontalContentPadding;
  final double borderRadius;

  final String label;
  final String mask;

  final Color labelColor;

  final Widget suffix;
  final Widget prefix;
  final Widget suffixIcon;
  final Widget prefixIcon;

  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextAlign textAlign;
  final TextStyle style;
  final TextChangeCallback onChanged;

  const SkyTextField({
    Key key,
    this.label = "",
    this.inputType = TextInputType.text,
    this.inputAction,
    this.obscureText = false,
    this.deobscureTextIcon = false,
    this.textAlign = TextAlign.start,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.mask,
    this.onChanged = _defaultChangeCallback,
    this.labelColor = Colors.blue,
    this.verticalContentPadding = 14,
    this.horizontalContentPadding = 8,
    this.borderRadius = 10,
    this.maxLines = 1,
  }) : super(key: key);

  Widget _buildTextField(BuildContext context) {
    TextEditingController controller;

    if (null != this.mask) {
      controller = MaskedTextController(mask: mask);
    }

    return PlatformTextField(
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText,
      controller: controller,
      keyboardType: inputType,
      textInputAction: inputAction,
      android: (context) => MaterialTextFieldData(
        decoration: InputDecoration(
          prefix: prefix,
          suffix: suffix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalContentPadding,
            horizontal: horizontalContentPadding,
          ),
        ),
        style: style,
      ),
      ios: (context) => CupertinoTextFieldData(
        prefix: prefix,
        suffix: suffix,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = _buildTextField(context);

    if (label != "") {
      widget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
          ),
          widget,
        ],
      );
    }

    return widget;
  }
}
