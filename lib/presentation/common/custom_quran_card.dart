import 'package:flutter/material.dart';

class CustomQuranCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const CustomQuranCard({super.key, required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255, 220, 224, 227),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}