import 'package:flutter/material.dart';
import 'package:mystery/features/create/widgets/template_item.dart';
import 'package:mystery/features/game/widgets/game_background.dart';
import 'package:mystery/widgets/page_title.dart';

class SelectTemplateScreen extends StatelessWidget {
  const SelectTemplateScreen({super.key});

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
                title: 'Select Template',
                subtitle:
                    'Lorem ipsum dolor sit amet consectetur. Tortor odio dignissim tortor aliquam porttitor id.',
              ),
              const SizedBox(height: 64),
              SizedBox(
                height: 368,
                child: ListView.separated(
                  itemCount: 5,
                  padding: const EdgeInsets.only(left: 20),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const TemplateItem();
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
