import 'dart:convert';
import 'dart:developer';

import '../../../services/germini_service.dart';
import '../domain/models/mystery_model.dart';

class ActiveGameDataSource {
  ActiveGameDataSource._();
  static final instance = ActiveGameDataSource._();

  final _geminiService = GeminiService();
  MysteryModel? mystery;

  Future<MysteryModel> getActiveGame() async {
    final res = await _geminiService.queryGemini(
      GeminiQueryModel(
        prompt: '''
You are tasked with creating a text-based detective game focused on solving a high-stakes mystery. The game should feature:
A Unique Character: The main character (victim/sleuth) with a distinct background(rich/slums) and situation that sets them apart.
One question that sets the tone for the mystery.
3+ Detailed Suspects: Each with distinct motives, secrets, clues that point both towards and away from their guilt amd short initial questions for the player to ask.
A Branching Dialogue System: Offer the player meaningful choices in how they interrogate, impacting what information they uncover.
At Least 2 Major Twists: Moments where the player's assumptions are challenged, forcing them to re-evaluate the evidence.
Correct Ending: An answer to the question. It must be clear who the true culprit is from the suspect roster.

Start by outlining:
Your character and their unique background/situation.
The crime that occured
Your suspect roster, including their relationship to the main character, motive, secrets, and any initial contradicting clues.
Remember, a compelling mystery thrives on misdirection and compelling characters!

Make it based a nigerian setting

Output format: a json encoded version of $outputFormat 
''',
      ),
    );
    log(res);
    final parsedRes = jsonDecode(
      res.substring(res.indexOf('{'), res.lastIndexOf('}') + 1),
    ) as Map<String, dynamic>;

    mystery = MysteryModel.fromMap(parsedRes);
    return mystery!;
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
