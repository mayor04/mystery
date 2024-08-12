import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mystery/app/models/story_detail_model.dart';
import 'package:mystery/app/models/story_model.dart';

import '../data/active_game_datasource.dart';

part 'game_state.dart';

class GameBloc extends Cubit<BaseGameState> {
  GameBloc({required this.gameStory}) : super(const InitialGameState());

  final ActiveGameDataSource gameDS = ActiveGameDataSource.instance;
  final StoryModel gameStory;

  Future<void> loadGame() async {
    // Load game if game exists, if not generate from gemini
    final detail = await gameDS.getActiveGame(gameStory);

    emit(
      GameState(
        gameStory: gameStory,
        storyDetails: detail,
        eventList: detail.events.map((e) => e.title).toList(),
      ),
    );
  }
}
