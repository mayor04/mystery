import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../app/models/event_model.dart';
import '../../../app/models/story_detail_model.dart';
import '../../../app/models/story_model.dart';
import '../../../services/germini_service.dart';
import '../domain/models/mystery_model.dart';

class ActiveGameDataSource {
  ActiveGameDataSource._();
  static final instance = ActiveGameDataSource._();

  final _geminiService = GeminiService();
  MysteryModel? mystery;

  Future<StoryModel> createGame(String story) async {
    final schema = Schema(
      SchemaType.object,
      properties: {
        'image': Schema.string(),
        'title': Schema.string(),
        'summary': Schema.string(),
        'question': Schema.string(),
        'ending': Schema.string(),
        'lesson': Schema.string(),
        'genres': Schema(
          SchemaType.array,
          items: Schema(SchemaType.string),
          nullable: false,
        ),
      },
      requiredProperties: [
        'title',
        'summary',
        'question',
        'ending',
        'lesson',
        'genres',
      ],
    );
    final res = await _geminiService.queryGemini(
      GeminiQueryModel(
        outputFormat: schema,
        prompt: '''
User intended story: $story
Using this story information, create a story with the following details; the story created must have an educational or informative purpose. 
Major Data: 
• Story Title: A catchy and descriptive title for your story.
• Story Summary: A brief overview of the plot, including the main characters and the central conflict.
• Image: An image that represents the story in an engaging way.
• General Question: A question that summarizes the mystery at the heart of the story.
• Story Ending: The resolution of the mystery, explaining the answer to the general question. This ending should be realistic and relatable.
• Lesson to be learnt: A key takeaway or message conveyed by the story. This can be a life lesson, an SDG, or a broader philosophical theme.
• 10 Genre Tags: Descriptive tags for the story's genre, such as Mystery, Drama, Thriller, etc.
Please ensure that the story idea is realistic and engaging.

NOTE: 
• The story should be in first person and should be a minimum of 80% unique.
''',
      ),
    );
    log(res);
    return StoryModel.fromMap(jsonDecode(res));
  }

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

  Future<List<EventModel>> getEventContinuation(
    StoryModel? story,
    StoryDetailsModel storyDetails,
    StoryEventModel event,
    List<EventModel> dialog,
  ) async {
    final res = await _geminiService.queryGemini(
      GeminiQueryModel(
        outputFormat: Schema.object(
          nullable: false,
          properties: {
            'text': Schema.string(),
            'choices': Schema.array(
              items: Schema.object(
                properties: {
                  'text': Schema.string(),
                  'index': Schema.integer(),
                },
                requiredProperties: ['text', 'index'],
              ),
            ),
          },
          requiredProperties: ['text', 'choices'],
        ),
        prompt:
            "Generate a scene continuation that follows the user's choice and remains "
            'within the scope of the event and the overall story. The continuation '
            'should be detailed and engaging, creating a sense of immersion for the '
            'user. Include at least three new choices for the user to make at the '
            'end of the continuation '

            // Add the user's choice and the event's context
            'Story Info: ${story?.toMap()}\n'
            'Story Details: ${storyDetails.toMap()}\n'
            'Selected Event: ${event.toMap()}\n'
            'Dialogs in the selected event: ${dialog.map((e) => e.toMap()).toList()}\n'

            // Tell AI that the user's choice is the next message
            // "Respond okay now, and then provide the user's choice after the next message"
            'Remember, the responses should be in json format as described in the schema',
      ),
    );
    log(res);
    return [
      EventStoryModel('id', text: jsonDecode(res)['text']),
      EventDecisionModel(
        'id',
        question: '',
        decisionDetails: List<String>.from(
          jsonDecode(res)['choices'].map((e) => e['text']),
        ),
      ),
    ];
  }

  Future<bool> solveMystery(String answer, StoryModel story) async {
    final schema = Schema(
      SchemaType.object,
      properties: {
        'is_correct': Schema.boolean(),
      },
      requiredProperties: [
        'is_correct',
      ],
    );
    final res = await _geminiService.queryGemini(
      GeminiQueryModel(
        outputFormat: schema,
        prompt: '''
User answer: $answer
Story info: ${story.toMap()}
Using this story information, create a response that indicates whether the user's answer is correct or incorrect. 
Major Data: 
• Is Correct: A boolean value that indicates whether the user's answer is correct or incorrect.
''',
      ),
    );
    log(res);
    return jsonDecode(res)['is_correct'] as bool;
  }
}
