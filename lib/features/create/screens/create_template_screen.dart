// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mystery/features/game/data/active_game_datasource.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/widgets/custom_button.dart';
import 'package:mystery/widgets/page_title.dart';

import '../../../constant/colors.dart';
import '../../../utils/app_fonts.dart';
import '../../game/screens/game_screen.dart';

class CreateTemplateScreen extends StatefulWidget {
  const CreateTemplateScreen({super.key});

  @override
  State<CreateTemplateScreen> createState() => CreateTemplateScreenState();
}

class CreateTemplateScreenState extends State<CreateTemplateScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isBusy = false;
  final hintText = '''
The city hums with a life of its own. Traffic flows seamlessly, public transportation runs on schedule, and streetlights flicker in perfect synchronization. This is New City, a futuristic metropolis built on the principles of efficiency and control.  You are Alex, a brilliant but reclusive computer programmer, living a solitary life in your cluttered apartment, surrounded by blinking screens and tangled wires. Your days are consumed by code, algorithms, and the pursuit of knowledge. You spend your nights exploring the depths of the internet, delving into the hidden corners of the digital world.
''';

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const PageTitle(
                    title: 'Create Story',
                    subtitle:
                        'This is your story, your adventure. Choose a template to start your journey.',
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 400,
                    child: TextFormField(
                      maxLines: 20,
                      controller: controller,
                      textCapitalization: TextCapitalization.sentences,
                      style: AppFonts.bodyMedium().copyWith(
                        color: AppColors.blue50,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a story';
                        }
                        if (value.length < 100) {
                          return 'Story must be at least 100 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: AppFonts.bodyMedium().copyWith(
                          color: AppColors.blue50.withOpacity(.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  AppButton(
                    text: 'Create',
                    child: isBusy
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.blue700,
                            ),
                          )
                        : null,
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      try {
                        setState(() => isBusy = true);
                        final res = await ActiveGameDataSource.instance
                            .createGame(controller.text);
                        unawaited(
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<GameScreen>(
                              builder: (context) => GameScreen(
                                gameStory: res,
                              ),
                            ),
                          ),
                        );
                      } finally {
                        setState(() => isBusy = false);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
