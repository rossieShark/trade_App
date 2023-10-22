import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.child,
      this.color,
      this.height,
      this.width,
      this.padding});
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            height: height ?? 54,
            width: width,
            color: color ?? const Color.fromARGB(255, 51, 55, 73),
            child: child),
      ),
    );
  }
}
