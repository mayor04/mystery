import 'dart:convert';

class StoryModel {
  final String title;
  final String summary;
  final String question;
  final String ending;
  final String lesson;
  final String imageUrl;
  final List<String> genres;

  StoryModel({
    required this.title,
    required this.summary,
    required this.question,
    required this.ending,
    required this.lesson,
    required this.imageUrl,
    required this.genres,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'summary': summary,
      'question': question,
      'ending': ending,
      'lesson': lesson,
      'genres': genres,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      title: map['title'] ?? '',
      summary: map['summary'] ?? '',
      question: map['question'] ?? '',
      ending: map['ending'] ?? '',
      lesson: map['lesson'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      genres: List<String>.from(map['genres'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source));
}

final mockStory = mockStoryList[0];
final mockStoryList = _mockStoryString.map(StoryModel.fromMap).toList();

final _mockStoryString = [
  {
    'title': 'The Glitch',
    'summary':
        'A group of brilliant scientists on the verge of launching a revolutionary technology are met with a series of suspicious accidents and failures.',
    'question':
        'Why is a groundbreaking innovation facing inexplicable setbacks right before its launch?',
    'ending':
        "The team discovers that their seemingly harmless competitor had sabotaged them, threatened by their project's potential.",
    'lesson':
        'Collaboration and trust are essential, but vigilance against competition is crucial in a field of high stakes.',
    'genres': ['Science Fiction', 'Thriller', 'Mystery', 'Drama', 'Technology'],
  },
  {
    'title': 'Echoes of a Melody',
    'summary':
        'Haunted by intensely real dreams of being a renowned musician, a young woman named Sarah embarks on a journey to understand their meaning.',
    'question':
        'Why does a young woman experience vivid, recurring dreams that seem rooted in a past she never lived?',
    'ending':
        "Through therapy and self-reflection, Sarah realizes her dreams were projections of her late father's unfulfilled aspirations, helping her find peace.",
    'lesson':
        'Understanding our dreams sometimes requires looking inward and confronting our past, allowing us to define our own path.',
    'genres': ['Drama', 'Psychological', 'Mystery', 'Self-Discovery', 'Family'],
  },
  {
    'title': 'The Secrets of Blackwood Manor',
    'summary':
        "A group of teenagers in a small town decide to investigate the local legend of a haunted house, only to uncover a mystery with deep roots in the town's history.",
    'question':
        'What is the truth behind the haunting of the abandoned Victorian mansion that has terrified generations?',
    'ending':
        'The town learns that the supposedly haunted house was a cover for a hidden room where the town founder had stashed his ill-gotten fortune.',
    'lesson':
        "Don't believe everything you hear; historical mysteries often have surprisingly earthly explanations.",
    'genres': [
      'Mystery',
      'Supernatural',
      'Historical',
      'Small Town',
      'Suspense',
    ],
  },
  {
    'title': 'The Taste of Home',
    'summary':
        "A celebrated chef struggling to recreate his late grandmother's signature dish embarks on a culinary journey to unlock the secrets of her recipe.",
    'question':
        "Why can't a renowned chef replicate his grandmother's legendary recipe, despite having all the ingredients?",
    'ending':
        "The chef discovers the secret ingredient was a rare herb grown only in his grandmother's village, reminding him of his heritage and passion.",
    'lesson':
        'Sometimes, our roots hold the key to unlocking our true potential and happiness.',
    'genres': ['Drama', 'Food', 'Culture', 'Family', 'Self-Discovery'],
  },
  {
    'title': 'The Map and the Misfits',
    'summary':
        'Four friends, armed with a faded treasure map, embark on an adventure to find a hidden pirate treasure during their summer vacation.',
    'question':
        'Will a group of friends find the legendary pirate treasure or will their quest reveal something even more valuable?',
    'ending':
        'Through investigation, they find that the real treasure was the friendships they made and the journey they shared, not the gold.',
    'lesson':
        'The true value of an adventure lies not in the destination but in the journey and the companions we share it with.',
    'genres': [
      'Adventure',
      'Friendship',
      'Comedy',
      'Coming of Age',
      'Treasure Hunt',
    ],
  }
];
