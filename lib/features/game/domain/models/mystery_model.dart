import 'dart:convert';

class MysteryModel {
  final String title;
  final String victim;
  final String crime;
  final String question;
  final List<SuspectModel> suspects;
  final List<TwistModel> twists;
  final String ending;
  MysteryModel({
    required this.title,
    required this.victim,
    required this.crime,
    required this.question,
    required this.suspects,
    required this.twists,
    required this.ending,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'victim': victim,
      'crime': crime,
      'question': question,
      'suspects': suspects.map((x) => x.toMap()).toList(),
      'twists': twists.map((x) => x.toMap()).toList(),
      'ending': ending,
    };
  }

  factory MysteryModel.fromMap(Map<String, dynamic> map) {
    return MysteryModel(
      title: map['title'] ?? '',
      victim: map['victim'] ?? '',
      crime: map['crime'] ?? '',
      question: map['question'] ?? '',
      suspects: List<SuspectModel>.from(
        map['suspects']?.map(
              (dynamic x) => SuspectModel.fromMap(x as Map<String, dynamic>),
            ) ??
            const [],
      ),
      twists: List<TwistModel>.from(
        map['twists']?.map(
              (dynamic x) => TwistModel.fromMap(x as Map<String, dynamic>),
            ) ??
            const [],
      ),
      ending: map['ending'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MysteryModel.fromJson(String source) =>
      MysteryModel.fromMap(json.decode(source));

  String get story => '$victim\n$crime\n\n$question';
}

class SuspectModel {
  final String name;
  final String relationship;
  final String motive;
  final String secret;
  final String contradictoryClue;
  SuspectModel({
    required this.name,
    required this.relationship,
    required this.motive,
    required this.secret,
    required this.contradictoryClue,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'relationship': relationship,
      'motive': motive,
      'secret': secret,
      'contradictory_clue': contradictoryClue,
    };
  }

  factory SuspectModel.fromMap(Map<String, dynamic> map) {
    return SuspectModel(
      name: map['name'] ?? '',
      relationship: map['relationship'] ?? '',
      motive: map['motive'] ?? '',
      secret: map['secret'] ?? '',
      contradictoryClue: map['contradictory_clue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SuspectModel.fromJson(String source) =>
      SuspectModel.fromMap(json.decode(source));
}

class TwistModel {
  final String name;
  final String description;

  TwistModel({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory TwistModel.fromMap(Map<String, dynamic> map) {
    return TwistModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TwistModel.fromJson(String source) =>
      TwistModel.fromMap(json.decode(source));
}

final da = {
  'title': '', // Length: 50 - 100 characters
  'victim': '', // Length: 200 - 500 characters
  'crime': '', // Length: 1000 - 2000 characters
  'suspects': [
    {
      'name': '',
      'relationship': '',
      'motive': '',
      'secret': '',
      'contradictory_clue': '',
    },
  ], // Length: 4+ objects
  'twists': [
    {
      'name': '',
      'description': '',
    },
  ], // Length: 1+ objects
  'ending': '',
};
