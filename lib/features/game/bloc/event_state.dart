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
  final List<EventModel> eventModel;
  final List<String> objectives;

  EventState({
    required this.eventModel,
    required this.objectives,
  });

  @override
  List<Object?> get props => [];
}
