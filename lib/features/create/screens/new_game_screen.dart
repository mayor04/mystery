import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/widgets/page_title.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 90),
              const PageTitle(
                title: 'Ready Player One!',
                subtitle:
                    'Experience your own fantasy adventure, shape your story and watch it come to life, guided by your imagination and choices.',
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 122,
                  ),
                  Container(
                    width: 225,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.blue50,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: const Color(0xFF000000),
                      ),
                    ),
                    child: Text(
                      'Create New',
                      style: AppFonts.bodyMedium().copyWith(
                        color: AppColors.blue700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 225,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: const Color(0xFFABB4BC),
                      ),
                    ),
                    child: Text(
                      ' Select from Templates',
                      style: AppFonts.bodyMedium().copyWith(
                        color: const Color(0xFFABB4BC),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 225,
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: AppColors.blue50,
                      ),
                    ),
                    child: Text(
                      'Select Random',
                      style: AppFonts.bodyMedium().copyWith(
                        color: AppColors.blue50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
