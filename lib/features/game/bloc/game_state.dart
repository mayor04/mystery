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

  GameState({
    required this.gameStory,
    required this.storyDetails,
    this.currentEvent,
    this.eventList = const [],
  });

  @override
  List<Object?> get props => [storyDetails, eventList];
}
