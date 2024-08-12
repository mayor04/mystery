import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystery/app/models/story_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/bloc/game_bloc.dart';
import 'package:mystery/features/game/screens/event_screen.dart';
import 'package:mystery/features/game/widgets/animated_words.dart';
import 'package:mystery/features/game/widgets/event_item.dart';
import 'package:mystery/features/game/widgets/event_selection_carousel.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/features/game/widgets/game_header.dart';
import 'package:mystery/utils/app_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    required this.gameStory,
    super.key,
  });

  final StoryModel gameStory;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final wordAnimationDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc(gameStory: widget.gameStory)..loadGame(),
      child: Scaffold(
        body: GameBackground.color(
          child: Column(
            children: [
              GameHeader(
                title: widget.gameStory.title,
                type: GameHeaderType.allEvents,
                onTapEvents: () {},
              ),
              Expanded(
                child: BlocBuilder<GameBloc, BaseGameState>(
                  builder: (context, state) {
                    if (state is InitialGameState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final gameState = state as GameState;

                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                            ),
                            child: Center(
                              child: Text(
                                gameState.gameStory.title,
                                style: AppFonts.bodyLarge(
                                  color: AppColors.textBeige,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // list view sliver
                        if (gameState.storyDetails.intro.isNotEmpty)
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 20,
                            ),
                            sliver: SliverToBoxAdapter(
                              child: Center(
                                child: AnimatedWords(
                                  text: gameState.storyDetails.intro,
                                  onAnimationEnd: () => context
                                      .read<GameBloc>()
                                      .toggleShowEvents(true),
                                ),
                              ),
                            ),
                          ),
                        if (gameState.showEvents)
                          if (gameState.storyDetails.events.isNotEmpty &&
                              gameState.currentEvent != null)
                            SliverPadding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 16,
                                right: 16,
                                bottom: 50,
                              ),
                              sliver: SliverList.separated(
                                itemCount: gameState.storyDetails.events.length,
                                itemBuilder: (_, index) {
                                  final event =
                                      gameState.storyDetails.events[index];
                                  return EventItem(
                                    event: event,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<EventScreen>(
                                          builder: (context) =>
                                              BlocProvider.value(
                                            value: context.read<GameBloc>(),
                                            child: EventScreen(
                                              event: event,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return SizedBox(
                                    height: 45,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 16),
                                        Container(
                                          height: 25,
                                          width: 3,
                                          color: AppColors.gameBlue,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                        if (gameState.currentEvent == null)
                          SliverToBoxAdapter(
                            child: EventSelectionCarousel(
                              events: gameState.storyDetails.events,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
