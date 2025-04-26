import 'package:flutter/material.dart';

class AppInputDecorations {
  static InputDecoration textFieldDecoration({
    String? label,
    String? hint,
    IconData? icon,
    Widget? suffixIcon,
    Widget? prefix,
    Color? fillColor,
    bool filled = true,
    EdgeInsetsGeometry? contentPadding,
    BorderRadius? borderRadius,
    Color? borderColor,
    double borderWidth = 1.0,
    Color? focusedBorderColor,
    double focusedBorderWidth = 2.0,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
  }) {
    final BorderRadius radius = borderRadius ?? BorderRadius.circular(12);
    final Color defaultBorderColor = borderColor ?? Colors.grey;
    final Color defaultFocusedColor = focusedBorderColor ?? Colors.blue;

    return InputDecoration(
      labelText: label ?? '',
      labelStyle: labelStyle ?? const TextStyle(fontSize: 14),
      hintText: hint ?? '',
      hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
      prefixIcon: icon != null ? Icon(icon) : null,
      prefix: prefix,
      suffixIcon: suffixIcon,
      filled: filled,
      fillColor: fillColor ?? Colors.grey.shade100,
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: defaultBorderColor, width: borderWidth)),
      focusedBorder: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: defaultFocusedColor, width: focusedBorderWidth)),
    );
  }
}
