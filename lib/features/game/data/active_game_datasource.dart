import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../app/models/story_detail_model.dart';
import '../../../app/models/story_model.dart';
import '../../../services/germini_service.dart';
import '../domain/models/mystery_model.dart';

class ActiveGameDataSource {
  ActiveGameDataSource._();
  static final instance = ActiveGameDataSource._();

  final _geminiService = GeminiService();
  MysteryModel? mystery;

  Future<StoryDetailsModel> getActiveGame(StoryModel story) async {
    final schema = Schema(
      SchemaType.object,
      properties: {
        'intro': Schema.string(),
        'events': Schema.array(
          nullable: false,
          items: Schema.object(
            properties: {
              'title': Schema.string(),
              'intro': Schema.string(),
              'choices': Schema(
                SchemaType.array,
                items: Schema(SchemaType.string),
                nullable: false,
              ),
              'tasks': Schema(
                SchemaType.array,
                items: Schema(SchemaType.string),
                nullable: false,
              ),
            },
            requiredProperties: ['title', 'intro', 'choices', 'tasks'],
          ),
        ),
        'number_of_events': Schema.number(
          description:
              'Number of events that must be opened and/or finished before the answer can guessed.'
              'This number must be more than two and less than the total number of events.',
        ),
      },
      requiredProperties: ['intro', 'events', 'number_of_events'],
    );
    final res = await _geminiService.queryGemini(
      GeminiQueryModel(
        outputFormat: schema,
        prompt: '''
Story Details: ${story.toMap()}
Using this story details and based off the story summary and the ending return 
Major Data: 
•⁠  ⁠Story Intro: A beginning to the story that that the events will be based off, the story should be reasonably long, and should be able to be broken down into multiple events
•⁠  ⁠⁠List of Events: An event is a next step that individually will give the user more context of the overall story and collectively with other event will give the user enough context to answer the overall question passed from phase 
• An event will contain an event title, an initial intro to the event, a list of choices that the user can make after reading the intro, and a list of tasks that should be completed in each event (the task is to remind the user the goal of the event).
•⁠  ⁠⁠Number of events that must be opened and/or finished before the answer can guessed.

NOTE: 
• The list events should be more than 3 and less than 10
• The Event title should be a sentence (not a phrase)
• The intro should be in first person and should be a minimum of 80% unique.
• The response (intro, events, and number before answer opportunity) must correlate to the phase 1 summary and ending by a minimum of 80%.
''',
      ),
    );
    log(res);
    return StoryDetailsModel.fromMap(jsonDecode(res));
  }
}
