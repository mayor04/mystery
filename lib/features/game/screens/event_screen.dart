import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/widgets/animated_words.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/features/game/widgets/game_header.dart';
import 'package:mystery/utils/app_fonts.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground.color(
        child: Column(
          children: [
            GameHeader(
              title: widget.title,
              type: GameHeaderType.ongoingEvent,
              onTapEvents: () => Navigator.pop(context),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                  color: Color(0xFF15181B),
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 16),
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.pink[200],
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Meet with richards family',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.bodySmall(
                            color: AppColors.textBeige,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            AnimatedWords(
                              text:
                                  'The family is in a crisis, they need your help to solve the mystery Lorem ipsum dolor sit amet consectetur. Amet eget felis sit enim sed. Euismod volutpat blandit vulputate mauris arcu aliquet quisque commodo ut. Venenatis morbi volutpat cursus sit quis nulla sed. Malesuada lectus placerat duis tortor. Interdum massa facilisis porttitor posuere a et. Dictum semper sapien amet amet id pulvinar. Pellentesque vitae quis dui eros tellus magna id. Elit',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
