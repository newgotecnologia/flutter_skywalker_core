import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MaterialBottomSheetData {
  VoidCallback onClosing;
}

// Ideally, this goes into FlutterPlatformWidgets
Future<T> showPlatformBottomSheet<T>(
  BuildContext context, {
  WidgetBuilder builder,
  MaterialBottomSheetData materialData,
  WidgetBuilder materialBuilder,
  WidgetBuilder cupertinoBuilder,
}) {
  if (null == builder) {
    assert(null != materialBuilder && null != cupertinoBuilder,
        "If no default builder is defined, material and cupertino builders are required.");
  }

  if (isMaterial) {
    return _showMaterialBottomSheet(
        context, materialBuilder ?? builder, materialData);
  } else if (isCupertino) {
    return _showCupertinoBottomSheet(context, cupertinoBuilder ?? builder);
  }

  return throw new UnsupportedError(
      'This platform is not supported: ' + Platform.operatingSystem);
}

Future<T> _showCupertinoBottomSheet<T>(
    BuildContext context, WidgetBuilder builder) {
  return showCupertinoModalPopup(
    context: context,
    builder: builder,
  );
}

Future<T> _showMaterialBottomSheet<T>(BuildContext context,
    WidgetBuilder builder, MaterialBottomSheetData materialData) {
  return showModalBottomSheet(
    context: context,
    builder: builder,
  );
}
