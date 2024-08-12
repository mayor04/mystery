// ignore_for_file: inference_failure_on_function_invocation, inference_failure_on_instance_creation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mystery/app/models/story_model.dart';
import 'package:mystery/features/create/screens/start_screen.dart';
import 'package:mystery/features/game/data/active_game_datasource.dart';
import 'package:mystery/widgets/custom_button.dart';

import '../../../constant/colors.dart';
import '../../../utils/app_fonts.dart';
import '../widgets/game_background.dart';
import 'game_screen.dart';

class AnswerDialog extends StatefulWidget {
  final StoryModel story;

  const AnswerDialog({
    super.key,
    required this.story,
  });

  static Future<void> show(BuildContext context, StoryModel story) async {
    await showDialog(
      context: context,
      builder: (context) => AnswerDialog(story: story),
    );
  }

  @override
  State<AnswerDialog> createState() => _AnswerDialogState();
}

class _AnswerDialogState extends State<AnswerDialog> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isBusy = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GameBackground.color(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Solve the mystery!',
                  style: AppFonts.headline3().copyWith(
                    color: AppColors.textBeige,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  widget.story.question,
                  textAlign: TextAlign.center,
                  style: AppFonts.bodyMedium().copyWith(
                    color: white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  minLines: 1,
                  maxLines: 5,
                  style: AppFonts.bodyMedium().copyWith(
                    color: AppColors.blue50,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a story';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your answer',
                    fillColor: white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: 'Submit',
                  child: isBusy
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.blue700,
                          ),
                        )
                      : null,
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    try {
                      setState(() => isBusy = true);
                      FocusScope.of(context).unfocus();
                      final res = await ActiveGameDataSource.instance
                          .solveMystery(controller.text, widget.story);
                      if (res) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Correct answer! You have earned 200 points!',
                            ),
                          ),
                        );
                        await Future.delayed(const Duration(seconds: 2));
                        unawaited(
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<GameScreen>(
                              builder: (context) => const StartScreen(),
                            ),
                            (route) => false,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Incorrect answer'),
                          ),
                        );
                      }
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
    );
  }
}
