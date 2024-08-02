import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';

class CharacterItem extends StatelessWidget {
  final String name;
  final String relationship;
  final String motive;

  const CharacterItem({
    super.key,
    required this.name,
    required this.relationship,
    required this.motive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.4,
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
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              color: white,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            relationship,
            style: const TextStyle(
              fontSize: 12,
              color: white,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Expanded(
            child: Text(
              motive,
              style: const TextStyle(
                fontSize: 12,
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
