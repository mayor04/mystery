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
  final List<String> openedEvents;
  final bool showEvents;

  GameState({
    required this.gameStory,
    required this.storyDetails,
    this.openedEvents = const [],
    this.eventList = const [],
    this.showEvents = false,
  });

  @override
  List<Object?> get props => [storyDetails, eventList];

  GameState copyWith({
    StoryModel? gameStory,
    StoryDetailsModel? storyDetails,
    List<String>? eventList,
    List<String>? openedEvents,
    bool? showEvents,
  }) {
    return GameState(
      gameStory: gameStory ?? this.gameStory,
      storyDetails: storyDetails ?? this.storyDetails,
      eventList: eventList ?? this.eventList,
      openedEvents: openedEvents ?? this.openedEvents,
      showEvents: showEvents ?? this.showEvents,
    );
  }

  bool get isAnyEventOpened => openedEvents.isNotEmpty;
  List<StoryEventModel> get openedEventModels => openedEvents
      .map((e) => storyDetails.events.firstWhere((element) => element.id == e))
      .toList();
  List<StoryEventModel> get closedEventModels => storyDetails.events
      .where((element) => !openedEvents.contains(element.id))
      .toList();
}
