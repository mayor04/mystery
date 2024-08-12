import 'package:flutter/material.dart';
import 'package:mystery/app/models/story_detail_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/widgets/animated_words.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/features/game/widgets/game_header.dart';
import 'package:mystery/utils/app_fonts.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    super.key,
    required this.event,
  });

  final StoryEventModel event;

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
              title: widget.event.title,
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.event.title,
                            textAlign: TextAlign.center,
                            style: AppFonts.bodySmall(
                              color: AppColors.textBeige,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            AnimatedWords(
                              text: widget.event.intro,
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
