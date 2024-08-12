import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class AnimatedWords extends StatefulWidget {
  const AnimatedWords({
    super.key,
    required this.text,
    this.duration = const Duration(milliseconds: 200),
    this.onAnimationEnd,
  });

  final String text;
  final Duration duration;
  final VoidCallback? onAnimationEnd;

  @override
  State<AnimatedWords> createState() => _AnimatedWordsState();
}

class _AnimatedWordsState extends State<AnimatedWords>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Color?>> _animations;
  late List<String> _words;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _words = widget.text.split(' ');
    _controller = AnimationController(
      duration: widget.duration * _words.length,
      vsync: this,
    );

    _animations = List<Animation<Color?>>.generate(
      _words.length,
      (index) => ColorTween(begin: white02, end: white09).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index / _words.length,
            (index + 1) / _words.length,
            curve: Curves.easeIn,
          ),
        ),
      ),
    );

    _controller
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed &&
            _words.length == currentIndex + 1) {
          widget.onAnimationEnd?.call();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: _words
                .asMap()
                .map(
                  (index, word) => MapEntry(
                    index,
                    TextSpan(
                      text: '$word ',
                      style: AppFonts.bodyLarge(
                        color: _animations[index].value,
                      ).copyWith(height: 1.8),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        );
      },
    );
  }
}
