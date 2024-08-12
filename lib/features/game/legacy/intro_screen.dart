import 'package:flutter/material.dart';
import 'package:mystery/features/game/domain/models/mystery_model.dart';
import 'package:mystery/features/game/domain/models/story_detail_model.dart';

import '../data/active_game_datasource.dart';
import '../domain/models/story_model.dart';
import 'characters_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _activeGameDataSource = ActiveGameDataSource.instance;
  MysteryModel? mystery;
  List<StoryModel> stories = [];
  StoryDetailModel? storyDetail;

  @override
  void initState() {
    super.initState();
    _activeGameDataSource.getActiveGame(mockStory).then((value) {
      storyDetail = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Screen'),
        // Add navigation to characters screen
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CharactersScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            storyDetail = await _activeGameDataSource.getActiveGame(mockStory);
            setState(() {});
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Text(
                  storyDetail?.intro ?? 'Mystery Title',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 40),
                Text(
                  '${storyDetail?.numberOfEvents ?? 'Story'}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: storyDetail?.events
                          .map(
                            (event) => Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  event.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  event.intro,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList() ??
                      [],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
