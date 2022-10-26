import 'package:flutter/material.dart';
import 'package:lunch_now/app/core/ui/extensions/theme_extension.dart';

class LunchnowDefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? color;
  final String label;
  final Color? labelColor;
  final double labelSize;
  final double padding;
  final double width;
  final double height;

  const LunchnowDefaultButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.borderRadius = 15,
    this.color,
    this.labelColor,
    this.labelSize = 20,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            backgroundColor: color ?? context.primaryColor),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
