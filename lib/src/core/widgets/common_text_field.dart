import 'package:flutter/material.dart';
import 'package:mpia/src/core/utils/ui_constants/app_colors.dart';
import 'package:mpia/src/core/utils/ui_constants/app_fonts.dart';
import 'package:mpia/src/core/widgets/common_text.dart';

class CommonTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Function(String)? onChanged;

  const CommonTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.backgroundColor,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: text,
          fontSize: 14,
          color: AppTheme.indigo44Color,
        ),
        const SizedBox(height: 2),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          obscureText: obscureText,
          onTap: onTap,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(
                prefixIcon,
                color: AppTheme.indigo44Color,
                size: 20,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 20,
              maxHeight: 20,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppTheme.hintStyle24Color,
              fontSize: 13,
            ),
            labelStyle: AppFonts.primaryRegularTextStyle,
            fillColor: backgroundColor ?? Colors.white,
            isDense: true,
            enabledBorder: _underlineInputBorder(),
            focusedBorder: _underlineInputBorder(),
            border: _underlineInputBorder(),
            errorBorder: _underlineInputBorder(color: AppTheme.errorColor),
            focusedErrorBorder:
                _underlineInputBorder(color: AppTheme.errorColor),
          ),
        ),
      ],
    );
  }

  UnderlineInputBorder _underlineInputBorder(
      {Color color = AppTheme.indigo44Color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.zero,
    );
  }
}
