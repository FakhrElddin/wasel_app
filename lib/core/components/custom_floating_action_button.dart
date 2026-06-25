import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.heroTag,
    this.onPressed,
    this.child,
  });

  final String heroTag;
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      child: child,
    );
  }
}
