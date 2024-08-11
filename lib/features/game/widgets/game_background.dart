import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.5, 1],
          colors: [
            Color(0xFF101F30),
            Color(0xFF101F30),
            Color(0xFF1A0E0A),
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
