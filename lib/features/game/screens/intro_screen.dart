import 'package:flutter/material.dart';
import 'package:mystery/features/game/screens/characters_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
          ]),
      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'The Mystery of the Missing',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 40),
              Text(
                'Rain lashed against the corrugated iron roof of the shed, a '
                "relentless drumming that vibrated in Maya's bones. Huddled "
                'beneath a threadbare blanket, she clutched the flickering '
                'lantern, its weak glow casting grotesque shadows that danced'
                ' across the dusty crates. Each rumble of thunder seemed closer, '
                'a harbinger of something monstrous lurking just beyond the flimsy walls.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
