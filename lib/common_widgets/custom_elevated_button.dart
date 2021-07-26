import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      this.child,
      this.color,
      this.borderRadius = 8.0,
      this.onPressed,
      this.height = 60.0})
      : assert(borderRadius != null),
        super(key: key);
  final Widget? child;
  final Color? color;
  final double? borderRadius;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            onSurface: color,
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius!)))),
        child: child,
      ),
    );
  }
}
