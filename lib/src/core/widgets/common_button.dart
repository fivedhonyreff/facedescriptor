import 'package:flutter/material.dart';
import 'package:mpia/src/core/utils/ui_constants/app_colors.dart';
import 'package:mpia/src/core/widgets/common_text.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final double? width;
  final double borderRadius;
  final Color? backgroundColor;
  final double? fontSize;
  final void Function()? onPressed;

  const CommonButton(
      {super.key,
      required this.text,
      this.width,
      this.borderRadius = 6,
      this.onPressed,
      this.fontSize,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: Size(width ?? double.infinity, 48),
      ),
      child: CommonText(
        text: text,
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
