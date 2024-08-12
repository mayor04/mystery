import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mystery/app/models/event_model.dart';
import 'package:mystery/app/models/story_detail_model.dart';
import 'package:mystery/features/game/data/active_game_datasource.dart';
import 'package:mystery/services/germini_service.dart';

part 'event_state.dart';

class EventBloc extends Cubit<BaseEventState> {
  final StoryDetailsModel storyDetails;
  final StoryEventModel event;

  EventBloc(
    this.storyDetails,
    this.event,
  ) : super(const InitialEventState());

  final gameDS = ActiveGameDataSource.instance;
  final geminiService = GeminiService();

  Future<void> loadEvent() async {
    final events = [
      EventStoryModel('id', text: event.intro),
      EventDecisionModel(
        'id',
        question: '',
        decisionDetails: event.choices,
      ),
    ];

    emit(
      EventState(
        eventModel: events,
        objectives: event.tasks,
      ),
    );
  }

  Future<void> makeDecision(String title) async {
    var state = this.state as EventState;
    emit(
      state.copyWith(
        eventModel: [
          ...state.eventModel.sublist(0, state.eventModel.length - 1),
          (state.eventModel.last as EventDecisionModel).copyWith(
            decidedEvent: title,
          ),
        ],
      ),
    );

    List<EventModel> result;
    result = await gameDS.getEventContinuation(
      null,
      storyDetails,
      event,
      state.eventModel,
    );
    state = this.state as EventState;

    emit(
      state.copyWith(
        eventModel: [
          ...state.eventModel,
          ...result,
        ],
      ),
    );
  }
}
