abstract class EventModel {
  final String id;

  const EventModel(this.id);
}

class StoryEventModel extends EventModel {
  final String text;

  const StoryEventModel(super.id, {required this.text});
}

// decision list - question - details
class DecisionEventModel extends EventModel {
  final String question;
  final Map<String, String> decisionDetails;
  final String? decidedEvent;

  const DecisionEventModel(
    super.id, {
    required this.question,
    required this.decisionDetails,
    this.decidedEvent,
  });
}

// create a list of events, story - decision - story - decision, story should be longer, without questions
final List<EventModel> mockEventList = [
  StoryEventModel(
    '1',
    text:
        'You are in a dark room, you can see a door in front of you, high above you can see a light shining through a small window. looking around you see a table with a candle on it, the candle is lit, but the room is still dark.',
  ),
  DecisionEventModel(
    '2',
    question: 'Do you open the door?',
    decisionDetails: {
      'yes': '3',
      'no': '4',
    },
  ),
  StoryEventModel(
    '3',
    text:
        'You open the door and see a long hallway, you can see a light at the end of the hallway, when darkness surrounds you, ',
  ),
  DecisionEventModel(
    '4',
    question: 'Do you stay in the room?',
    decisionDetails: {
      'yes': '5',
      'no': '6',
    },
  ),
  StoryEventModel(
    '5',
    text: 'You stay in the room and hear a loud noise, what do you do?',
  ),
  DecisionEventModel(
    '6',
    question: 'Do you leave the room?',
    decisionDetails: {
      'yes': '7',
      'no': '8',
    },
  ),
  StoryEventModel(
    '7',
    text:
        'You leave the room and see a long hallway, you can see a light at the end of the hallway, what do you do?',
  ),
  DecisionEventModel(
    '8',
    question: 'Do you stay in the room?',
    decisionDetails: {
      'yes': '9',
      'no': '10',
    },
  ),
  StoryEventModel(
    '9',
    text: 'You stay in the room and hear a loud noise, what do you do?',
  ),
  DecisionEventModel(
    '10',
    question: 'Do you leave the room?',
    decisionDetails: {
      'yes': '11',
      'no': '12',
    },
  ),
  StoryEventModel(
    '11',
    text:
        'You leave the room and see a long hallway, you can see a light at the end of the hallway, what do you do?',
  ),
  DecisionEventModel(
    '12',
    question: 'Do you stay in the room?',
    decisionDetails: {
      'yes': '13',
      'no': '14',
    },
  ),
];
