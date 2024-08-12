import 'package:flutter/material.dart';
import 'package:mystery/features/game/domain/models/mystery_model.dart';

import '../data/active_game_datasource.dart';
import 'characters_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _activeGameDataSource = ActiveGameDataSource.instance;
  MysteryModel? mystery;

  @override
  void initState() {
    super.initState();
    // _activeGameDataSource.getActiveGame().then((value) {
    //   mystery = value;
    //   setState(() {});
    // });
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
                  builder: (context) => const CharactersScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            // mystery = await _activeGameDataSource.getActiveGame();
            setState(() {});
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  mystery?.title ?? 'Mystery Title',
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
                  mystery?.story ?? 'Story',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
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
