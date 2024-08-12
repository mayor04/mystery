import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystery/app/models/event_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/bloc/event_bloc.dart';
import 'package:mystery/features/game/widgets/animated_words.dart';
import 'package:mystery/features/game/widgets/decision_box.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/features/game/widgets/game_header.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/utils/images.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    super.key,
  });

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventBloc()..loadEvent(),
      child: Scaffold(
        body: GameBackground.color(
          child: Column(
            children: [
              GameHeader(
                title: '',
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
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Images.multiArrowForward),
                              const SizedBox(width: 20),
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.pink[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SvgPicture.asset(Images.multiArrowBack),
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
                      BlocBuilder<EventBloc, BaseEventState>(
                        builder: (context, state) {
                          if (state is InitialEventState) {
                            return const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          final gameEvent = state as EventState;

                          return Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: gameEvent.eventModel.map((e) {
                                  if (e is StoryEventModel) {
                                    return AnimatedWords(
                                      text: e.text,
                                    );
                                  } else if (e is DecisionEventModel) {
                                    return DecisionBox(
                                      decisionEvent: e,
                                    );
                                  }
                                  return const SizedBox();
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
