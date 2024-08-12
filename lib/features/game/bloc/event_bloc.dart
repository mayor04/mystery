import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mystery/app/models/event_model.dart';

part 'event_state.dart';

class EventBloc extends Cubit<BaseEventState> {
  EventBloc() : super(const InitialEventState());

  void loadEvent() async {
    // Load Event if Event exists, if not generate from gemini
    await Future.delayed(const Duration(milliseconds: 2000));

    emit(
      EventState(
        eventModel: mockEventList,
        objectives: [],
      ),
    );
  }
}
