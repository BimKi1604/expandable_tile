import 'package:flutter/material.dart';

class ClickWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color? color;

  const ClickWidget({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(4),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        splashColor: color?.withAlpha(50),
        borderRadius: borderRadius,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
