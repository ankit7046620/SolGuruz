import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final double? height;
  final double? width;
  final Widget? icon; // New optional icon
  final Key? key;

  const CommonElevatedButton({
    this.key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.height,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.0,
      width: width, // if null, takes child's width
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style:
            style ??
            ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
            ),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: icon != null ? Row(mainAxisSize: MainAxisSize.min, children: [icon!, const SizedBox(width: 8), child]) : child,
      ),
    );
  }
}
