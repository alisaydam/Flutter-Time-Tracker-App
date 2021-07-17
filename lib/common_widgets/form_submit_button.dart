import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:time_tracker/common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    required String text,
    VoidCallback? onPressed,
  }) : super(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            height: 44,
            color: Colors.indigo,
            onPressed: onPressed);
}
