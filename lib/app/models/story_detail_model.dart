import 'dart:convert';

import 'package:uuid/uuid.dart';

class StoryDetailsModel {
  final String id;
  final String intro;
  final List<StoryEventModel> events;
  final int numberOfEvents;

  StoryDetailsModel({
    required this.id,
    required this.intro,
    required this.events,
    required this.numberOfEvents,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'intro': intro,
      'events': events.map((x) => x.toMap()).toList(),
      'number_of_events': numberOfEvents,
    };
  }

  factory StoryDetailsModel.fromMap(Map<String, dynamic> map) {
    return StoryDetailsModel(
      id: map['id'] ?? const Uuid().v4(),
      intro: map['intro'] ?? '',
      events: List<StoryEventModel>.from(
        map['events']?.map((x) => StoryEventModel.fromMap(x)) ?? const [],
      ),
      numberOfEvents: map['number_of_events']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryDetailsModel.fromJson(String source) =>
      StoryDetailsModel.fromMap(json.decode(source));
}

class StoryEventModel {
  final String id;
  final String title;
  final String intro;
  final List<String> choices;
  final List<String> tasks;

  StoryEventModel({
    required this.id,
    required this.title,
    required this.intro,
    required this.choices,
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'intro': intro,
      'choices': choices,
      'tasks': tasks,
    };
  }

  factory StoryEventModel.fromMap(Map<String, dynamic> map) {
    return StoryEventModel(
      id: map['id'] ?? const Uuid().v4(),
      title: map['title'] ?? '',
      intro: map['intro'] ?? '',
      choices: List<String>.from(map['choices'] ?? const []),
      tasks: List<String>.from(map['tasks'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryEventModel.fromJson(String source) =>
      StoryEventModel.fromMap(json.decode(source));

  StoryEventModel copyWith({
    String? title,
    String? intro,
    List<String>? choices,
    List<String>? tasks,
  }) {
    return StoryEventModel(
      id: id,
      title: title ?? this.title,
      intro: intro ?? this.intro,
      choices: choices ?? this.choices,
      tasks: tasks ?? this.tasks,
    );
  }
}

// Generate a mock for the date above with different events and different intro and different choices and different tasks
final mockStoryDetails = StoryDetailsModel.fromMap(
  {
    'intro':
        'When a groundbreaking innovation faces inexplicable setbacks right before its launch, a group of brilliant scientists must investigate the cause of the glitches. through a series of events, the team must work together to solve the mystery and save the project. follow the story to uncover the truth.',
    'events': [
      {
        'title': 'The Glitch',
        'intro':
            'A group of brilliant scientists on the verge of launching a revolutionary technology are met with a series of suspicious accidents and failures.',
        'choices': [
          'Investigate the lab',
          'Question the team',
          'Review the data',
        ],
        'tasks': [
          'Investigate the lab',
          'Question the team',
          'Review the data',
        ],
      },
      {
        'title': 'The Glitch',
        'intro':
            'A group of brilliant scientists on the verge of launching a revolutionary technology are met with a series of suspicious accidents and failures.',
        'choices': [
          'Investigate the lab',
          'Question the team',
          'Review the data',
        ],
        'tasks': [
          'Investigate the lab',
          'Question the team',
          'Review the data',
        ],
      },
      {
        'title': 'The Glitch',
        'intro':
            'A group of brilliant scientists on the verge of launching a revolutionary technology are met with a series of suspicious accidents and failures.',
        'choices': [
          'Investigate the lab',
          'Question the team',
          'Review the data',
        ],
        'tasks': [
          'Investigate the lab',
          'Question the team',
          'Review the data',
        ],
      },
    ],
    'number_of_events': 3,
  },
);
