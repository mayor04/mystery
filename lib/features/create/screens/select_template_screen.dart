import 'package:flutter/material.dart';
import 'package:mystery/app/models/story_model.dart';
import 'package:mystery/features/create/widgets/template_item.dart';
import 'package:mystery/features/game/screens/game_screen.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/widgets/page_title.dart';

class SelectTemplateScreen extends StatefulWidget {
  const SelectTemplateScreen({super.key});

  @override
  State<SelectTemplateScreen> createState() => _SelectTemplateScreenState();
}

class _SelectTemplateScreenState extends State<SelectTemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const PageTitle(
                title: 'Story Library',
                subtitle:
                    'Welcome to the story library. Choose a story template to start your adventure.',
              ),
              const SizedBox(height: 64),
              SizedBox(
                height: 450,
                child: ListView.separated(
                  itemCount: mockStoryList.length,
                  padding: const EdgeInsets.only(left: 20),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final mockStory = mockStoryList[index];

                    return TemplateItem(
                      model: mockStory,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<GameScreen>(
                            builder: (context) => GameScreen(
                              gameStory: mockStory,
                            ),
                          ),
                        );
                        // Add navigation to create screen
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
