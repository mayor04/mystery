import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystery/features/create/screens/select_template_screen.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/utils/images.dart';
import 'package:mystery/widgets/custom_button.dart';
import 'package:mystery/widgets/page_title.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              PageTitle(
                titleWidget: SvgPicture.asset(
                  Images.mysteryText,
                ),
                subtitle:
                    'Experience your own fantasy adventure, shape your story and watch it come to life, guided by your imagination and choices.',
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  AppButton(
                    text: 'Create New',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton.border(
                    text: 'Select From Templates',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<SelectTemplateScreen>(
                          builder: (context) => const SelectTemplateScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton.border(
                    text: 'Continue Previous',
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
