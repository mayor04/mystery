import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mystery/features/game/domain/models/story_detail_model.dart';
import 'package:mystery/features/game/domain/models/story_model.dart';

import '../../../services/germini_service.dart';
import '../domain/models/mystery_model.dart';

class ActiveGameDataSource {
  ActiveGameDataSource._();
  static final instance = ActiveGameDataSource._();

  final _geminiService = GeminiService();
  MysteryModel? mystery;

  Future<StoryDetailModel> getActiveGame(StoryModel story) async {
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
We select a story, go into it and based off the story summary and the ending return 
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
    return StoryDetailModel.fromMap(jsonDecode(res));
  }

  Future<StoryDetailModel> getInGameFlow(StoryDetailModel story) async {
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
We select a story, go into it and based off the story summary and the ending return 
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
    return StoryDetailModel.fromMap(jsonDecode(res));
  }

  Stream<String> streamActiveGame() {
    final data = _geminiService.streamGemini(
      GeminiQueryModel(
        prompt: '''
You are tasked with creating a text-based detective game focused on solving a high-stakes mystery. The game should feature:
A Unique Character: The main character (victim/sleuth) with a distinct background(rich/slums) and situation that sets them apart.
3+ Detailed Suspects: Each with distinct motives, secrets, and clues that point both towards and away from their guilt.
A Branching Dialogue System: Offer the player meaningful choices in how they interrogate, impacting what information they uncover.
At Least 2 Major Twists: Moments where the player's assumptions are challenged, forcing them to re-evaluate the evidence.
Correct Endings: A satisfying conclusion that ties up all loose ends and reveals who the true culprit is from the suspect roster and answers the question.

Start by outlining:
Your character and their unique background/situation.
The crime that occured
Your suspect roster, including their relationship to the main character, motive, secrets, and any initial contradicting clues.
Remember, a compelling mystery thrives on misdirection and compelling characters!

Make it based a nigerian setting

Output format: $outputFormat 
''',
      ),
    );

    return data..listen(log);
  }

  final outputFormat = '''
{
    'title': '', // Length: 50 - 100 characters
    'victim': '', // Length: 200 - 500 characters
    'crime': '', // Length: 1000 - 2000 characters
    'question': '', // Length: 100 - 200 characters
    'suspects': [
      {
        'name': '',
        'relationship': '',
        'motive': '',
        'secret': '',
        'contradictory_clue': '',
        'questions': [
          'question1', 'question2', 'question3'
        ],
      },
    ], // Length: 4+ objects
    'twists': [
      {
        'name': '',
        'description': '',
      },
    ], // Length: 1+ objects
    'ending': '',
  }
''';
}

/*
You are tasked with creating a text-based detective game focused on solving a 
high-stakes mystery. The game should feature:
A Unique Character: The main character (victim/sleuth) with a distinct background(rich/slums) and situation that sets them apart.
One question that sets the tone for the mystery.
3+ Detailed Suspects: Each with distinct motives, secrets, clues that point both 
towards and away from their guilt amd short initial questions for the player to
 ask.
A Branching Dialogue System: Offer the player meaningful choices in how they 
interrogate, impacting what information they uncover.
At Least 2 Major Twists: Moments where the player's assumptions are challenged, 
forcing them to re-evaluate the evidence.
Correct Ending: An answer to the question. It must be clear who the true culprit 
is from the suspect roster.

Start by outlining:
Your character and their unique background/situation.
The crime that occured
Your suspect roster, including their relationship to the main character, motive,
 secrets, and any initial contradicting clues.
Remember, a compelling mystery thrives on misdirection and compelling 
characters!

Make it based a nigerian setting

Output format: a json encoded version of $outputFormat 
*/


//   Future<List<StoryModel>> getGames() async {
//     final schema = Schema(
//       SchemaType.array,
//       nullable: false,
//       items: Schema(
//         SchemaType.object,
//         properties: {
//           'image': Schema.string(),
//           'title': Schema.string(),
//           'summary': Schema.string(),
//           'question': Schema.string(),
//           'ending': Schema.string(),
//           'lesson': Schema.string(),
//           'genres': Schema(
//             SchemaType.array,
//             items: Schema(SchemaType.string),
//             nullable: false,
//           ),
//         },
//         requiredProperties: [
//           'title',
//           'summary',
//           'question',
//           'ending',
//           'lesson',
//           'genres',
//         ],
//       ),
//     );
//     final res = await _geminiService.queryGemini(
//       GeminiQueryModel(
//         outputFormat: schema,
//         prompt: '''
// Please provide a list of 5 story ideas, each with the following information:
// Story Title: A catchy and descriptive title for your story.
// Story Summary: A brief overview of the plot, including the main characters and the central conflict.
// Image: An image that represents the story in an engaging way.
// General Question: A question that summarizes the mystery at the heart of the story.
// Story Ending: The resolution of the mystery, explaining the answer to the general question. This ending should be realistic and relatable.
// Lesson to be learnt: A key takeaway or message conveyed by the story. This can be a life lesson, an SDG, or a broader philosophical theme.
// 10 Genre Tags: Descriptive tags for the story's genre, such as Mystery, Drama, Thriller, etc.
// Please ensure that each story idea is distinct and unique.
// ''',
//       ),
//     );
//     log(res);
//     return (jsonDecode(res) as List).map((e) => StoryModel.fromMap(e)).toList();
//   }