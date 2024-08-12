import 'dart:convert';

class StoryDetailModel {
  final String intro;
  final List<StoryEventModel> events;
  final int numberOfEvents;

  StoryDetailModel({
    required this.intro,
    required this.events,
    required this.numberOfEvents,
  });

  Map<String, dynamic> toMap() {
    return {
      'intro': intro,
      'events': events.map((x) => x.toMap()).toList(),
      'number_of_events': numberOfEvents,
    };
  }

  factory StoryDetailModel.fromMap(Map<String, dynamic> map) {
    return StoryDetailModel(
      intro: map['intro'] ?? '',
      events: List<StoryEventModel>.from(
        map['events']?.map((x) => StoryEventModel.fromMap(x)) ?? const [],
      ),
      numberOfEvents: map['number_of_events']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryDetailModel.fromJson(String source) =>
      StoryDetailModel.fromMap(json.decode(source));
}

class StoryEventModel {
  final String title;
  final String intro;
  final List<String> choices;
  final List<String> tasks;

  StoryEventModel({
    required this.title,
    required this.intro,
    required this.choices,
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'intro': intro,
      'choices': choices,
      'tasks': tasks,
    };
  }

  factory StoryEventModel.fromMap(Map<String, dynamic> map) {
    return StoryEventModel(
      title: map['title'] ?? '',
      intro: map['intro'] ?? '',
      choices: List<String>.from(map['choices'] ?? const []),
      tasks: List<String>.from(map['tasks'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryEventModel.fromJson(String source) =>
      StoryEventModel.fromMap(json.decode(source));
}
