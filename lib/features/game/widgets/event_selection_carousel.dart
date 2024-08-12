import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/bloc/game_bloc.dart';
import 'package:mystery/features/game/screens/event_screen.dart';
import 'package:mystery/features/game/widgets/event_selection_item.dart';
import 'package:mystery/utils/app_fonts.dart';

import '../../../app/models/story_detail_model.dart';

class EventSelectionCarousel extends StatefulWidget {
  const EventSelectionCarousel({
    super.key,
    required this.events,
  });
  final List<StoryEventModel> events;

  @override
  State<EventSelectionCarousel> createState() => _EventSelectionCarouselState();
}

class _EventSelectionCarouselState extends State<EventSelectionCarousel> {
  final _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          'Pick your next event',
          style: AppFonts.bodySmall(
            color: AppColors.textBeige,
          ),
        ),
        SizedBox(
          height: 414,
          child: PageView.builder(
            itemCount: widget.events.length,
            controller: _controller,
            itemBuilder: (context, index) {
              // final selectedIndex = _controller.page?.round() ?? 0;
              // final isSelected = selectedIndex == index;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 30,
                ),
                child: EventSelectionItem(
                  event: widget.events[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<EventScreen>(
                        builder: (_) => BlocProvider.value(
                          value: context.read<GameBloc>(),
                          child:  EventScreen(event: widget.events[index]),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
