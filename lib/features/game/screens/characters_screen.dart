import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Characters Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(10, (index) => const CharacterItem()),
          ),
        ),
      ),
    );
  }
}
