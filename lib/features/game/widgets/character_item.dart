import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: white),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: white),
            ),
            child: const Icon(
              Icons.person,
              color: AppColors.demoBlue,
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          const Text(
            'Character',
            style: TextStyle(
              fontSize: 14,
              color: white,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            'More Details',
            style: TextStyle(
              fontSize: 12,
              color: white,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            'Type',
            style: TextStyle(
              fontSize: 12,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
