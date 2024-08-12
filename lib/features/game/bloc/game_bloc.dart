import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mystery/app/models/story_detail_model.dart';
import 'package:mystery/app/models/story_model.dart';

part 'game_state.dart';

class GameBloc extends Cubit<BaseGameState> {
  GameBloc({required this.gameStory}) : super(const InitialGameState());

  final StoryModel gameStory;

  void loadGame() {
    // Load game if game exists, if not generate from gemini

    emit(
      GameState(
        gameStory: gameStory,
        storyDetails: mockStoryDetails,
      ),
    );
  }
}
