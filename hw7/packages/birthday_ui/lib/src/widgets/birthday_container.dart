import 'package:flutter/material.dart';

class BirthdayContainer extends StatelessWidget {
  const BirthdayContainer({
    super.key,
    this.borderRadius,
    this.color,
    this.shape = BoxShape.rectangle,
    this.child,
  });

  final BorderRadius? borderRadius;
  final Color? color;
  final BoxShape shape;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
        shape: shape,
      ),
      child: child,
    );
  }
}
