part of 'event_bloc.dart';

abstract class BaseEventState extends Equatable {
  const BaseEventState();
}

class InitialEventState extends BaseEventState {
  const InitialEventState();

  @override
  List<Object> get props => [];
}

class EventState extends BaseEventState with EquatableMixin {
  final StoryDetailsModel? story;
  final StoryEventModel? eventIntro;
  final List<EventModel> eventModel;
  final List<String> objectives;

  EventState({
    this.story,
    this.eventIntro,
    required this.eventModel,
    required this.objectives,
  });

  @override
  List<Object?> get props => [story, eventIntro, eventModel, objectives];

  EventState copyWith({
    StoryDetailsModel? story,
    StoryEventModel? eventIntro,
    List<EventModel>? eventModel,
    List<String>? objectives,
  }) {
    return EventState(
      story: story ?? this.story,
      eventIntro: eventIntro ?? this.eventIntro,
      eventModel: eventModel ?? this.eventModel,
      objectives: objectives ?? this.objectives,
    );
  }
}
