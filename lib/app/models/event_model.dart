import 'dart:convert';

abstract class EventModel {
  final String id;

  const EventModel(this.id);

  Map<String, dynamic> toMap();
}

class EventStoryModel extends EventModel {
  final String text;

  const EventStoryModel(super.id, {required this.text});

  @override
  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }

  factory EventStoryModel.fromMap(Map<String, dynamic> map) {
    return EventStoryModel(
      map['id'] ?? 'id',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventStoryModel.fromJson(String source) =>
      EventStoryModel.fromMap(json.decode(source));
}

// decision list - question - details
class EventDecisionModel extends EventModel {
  final String question;
  final List<String> decisionDetails;
  final String? decidedEvent;

  const EventDecisionModel(
    super.id, {
    required this.question,
    required this.decisionDetails,
    this.decidedEvent,
  });

  EventDecisionModel copyWith({
    String? question,
    List<String>? decisionDetails,
    String? decidedEvent,
  }) {
    return EventDecisionModel(
      id,
      question: question ?? this.question,
      decisionDetails: decisionDetails ?? this.decisionDetails,
      decidedEvent: decidedEvent ?? this.decidedEvent,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'decision_details': decisionDetails,
      'decided_event': decidedEvent,
    };
  }

  factory EventDecisionModel.fromMap(Map<String, dynamic> map) {
    return EventDecisionModel(
      map['id'] ?? 'id',
      question: map['question'] ?? '',
      decisionDetails: List<String>.from(map['decision_details'] ?? const {}),
      decidedEvent: map['decided_event'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventDecisionModel.fromJson(String source) =>
      EventDecisionModel.fromMap(json.decode(source));
}

// create a list of events, story - decision - story - decision, story should be longer, without questions
final List<EventModel> mockEventList = [
  const EventStoryModel(
    '1',
    text:
        'You are in a dark room, you can see a door in front of you, high above you can see a light shining through a small window. looking around you see a table with a candle on it, the candle is lit, but the room is still dark.',
  ),
  const EventDecisionModel(
    '2',
    question: 'Do you open the door?',
    decisionDetails: ['yes', 'no'],
  ),
  const EventStoryModel(
    '3',
    text:
        'You open the door and see a long hallway, you can see a light at the end of the hallway, when darkness surrounds you, ',
  ),
  const EventDecisionModel(
    '4',
    question: 'Do you stay in the room?',
    decisionDetails: ['yes', 'no'],
  ),
  const EventStoryModel(
    '5',
    text: 'You stay in the room and hear a loud noise, what do you do?',
  ),
  const EventDecisionModel(
    '6',
    question: 'Do you leave the room?',
    decisionDetails: ['yes', 'no'],
  ),
  const EventStoryModel(
    '7',
    text:
        'You leave the room and see a long hallway, you can see a light at the end of the hallway, what do you do?',
  ),
  const EventDecisionModel(
    '8',
    question: 'Do you stay in the room?',
    decisionDetails: ['yes', 'no'],
  ),
  const EventStoryModel(
    '9',
    text: 'You stay in the room and hear a loud noise, what do you do?',
  ),
  const EventDecisionModel(
    '10',
    question: 'Do you leave the room?',
    decisionDetails: ['yes', 'no'],
  ),
  const EventStoryModel(
    '11',
    text:
        'You leave the room and see a long hallway, you can see a light at the end of the hallway, what do you do?',
  ),
  const EventDecisionModel(
    '12',
    question: 'Do you stay in the room?',
    decisionDetails: ['yes', 'no'],
  ),
];
