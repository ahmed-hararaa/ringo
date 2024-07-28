import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double radius;
  final Color color;
  final Widget? child;
  const Circle({super.key, required this.radius, required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color
      ),
      child: child,
    );
  }
}
