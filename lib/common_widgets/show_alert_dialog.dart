import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?>? showAlertDialog({
  BuildContext? context,
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(defaultActionText))
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context!,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(defaultActionText))
      ],
    ),
  );
}
