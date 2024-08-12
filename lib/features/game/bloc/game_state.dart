part of 'game_bloc.dart';

abstract class BaseGameState extends Equatable {
  const BaseGameState();
}

class InitialGameState extends BaseGameState {
  const InitialGameState();

  @override
  List<Object> get props => [];
}

class GameState extends BaseGameState with EquatableMixin {
  final StoryModel gameStory;
  final StoryDetailsModel storyDetails;
  final List<String> eventList;
  final String? currentEvent;
  final bool showEvents;

  GameState({
    required this.gameStory,
    required this.storyDetails,
    this.currentEvent,
    this.eventList = const [],
    this.showEvents = false,
  });

  @override
  List<Object?> get props => [storyDetails, eventList];

  GameState copyWith({
    StoryModel? gameStory,
    StoryDetailsModel? storyDetails,
    List<String>? eventList,
    String? currentEvent,
    bool? showEvents,
  }) {
    return GameState(
      gameStory: gameStory ?? this.gameStory,
      storyDetails: storyDetails ?? this.storyDetails,
      eventList: eventList ?? this.eventList,
      currentEvent: currentEvent ?? this.currentEvent,
      showEvents: showEvents ?? this.showEvents,
    );
  }
}
