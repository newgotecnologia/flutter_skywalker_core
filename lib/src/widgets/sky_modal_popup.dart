import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_skywalker_core/src/util/platform_bottom_sheet.dart';
import 'package:flutter_skywalker_core/src/widgets/sky_text_button.dart';

Future<T> showSkyConfirmPopup<T>(
  BuildContext context,
  String title,
  String content,
  String confirmOptionTitle,
  VoidCallback onConfirm, {
  String cancelOptionTitle,
  VoidCallback onCancel,
  Color confirmOptionButtonBackgroundColor = Colors.green,
  Color confirmOptionButtonTextColor = Colors.white,
  double confirmOptionButtonFontSize = 16,
  double messageFontSize = 16,
  double titleFontSize = 24,
}) {
  Widget titleWidget = Text(
    title,
    style: TextStyle(
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget messageWidget = Text(
    content,
    style: TextStyle(
      fontSize: messageFontSize,
    ),
    textAlign: TextAlign.center,
  );

  Widget materialContent = Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        titleWidget,
        SizedBox(height: 16),
        messageWidget,
        SizedBox(height: 24),
        SkyTextButton(
          confirmOptionTitle,
          backgroundColor: confirmOptionButtonBackgroundColor,
          textColor: confirmOptionButtonTextColor,
          fontSize: confirmOptionButtonFontSize,
          onPressed: onConfirm,
        ),
      ],
    ),
  );

  Widget cupertinoCancelAction;
  if (null != cancelOptionTitle && null != onCancel) {
    cupertinoCancelAction = CupertinoActionSheetAction(
      onPressed: onCancel,
      child: Text(cancelOptionTitle),
    );

    Widget cancelOption = SkyTextButton(
      cancelOptionTitle,
      onPressed: onCancel,
    );
    ((materialContent as Padding).child as Column).children.add(cancelOption);
  }

  return showPlatformBottomSheet(
    context,
    materialBuilder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) => materialContent,
      );
    },
    cupertinoBuilder: (context) {
      return CupertinoActionSheet(
        title: titleWidget,
        message: messageWidget,
        cancelButton: cupertinoCancelAction,
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: onConfirm,
            child: Text(confirmOptionTitle),
          )
        ],
      );
    },
  );
}
