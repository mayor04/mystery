import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({
    required this.child,
    super.key,
  }) : gradient = true;

  const GameBackground.color({
    required this.child,
    super.key,
  }) : gradient = false;

  final Widget child;
  final bool gradient;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: gradient ? null : AppColors.gameBackground,
        gradient: gradient
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.5, 1],
                colors: [
                  Color(0xFF101F30),
                  Color(0xFF101F30),
                  Color(0xFF1A0E0A),
                ],
              )
            : null,
      ),
      child: SafeArea(child: child),
    );
  }
}
