// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/utils/images.dart';

enum GameHeaderType {
  ongoingEvent,
  allEvents,
}

class GameHeader extends StatelessWidget {
  const GameHeader({
    required this.type,
    required this.onTapEvents,
    required this.title,
    super.key,
  });

  final GameHeaderType type;
  final VoidCallback onTapEvents;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTapEvents,
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 11),
              decoration: const BoxDecoration(
                color: Color(0xFF293253),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RotatedBox(
                    quarterTurns: type == GameHeaderType.ongoingEvent ? 0 : 2,
                    child: SvgPicture.asset(Images.backTo),
                  ),
                  const SizedBox(width: 9),
                  Text(
                    type == GameHeaderType.ongoingEvent ? 'Past Events' : 'All Events',
                    style: AppFonts.bodyXS().copyWith(
                      color: AppColors.textBeige,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Text(
          //   title,
          //   style: AppFonts.bodySmall().copyWith(
          //     color: AppColors.textBeige,
          //   ),
          // ),
          const Spacer(),

          Container(
            height: 26,
            padding: const EdgeInsets.symmetric(horizontal: 11),
            decoration: const BoxDecoration(
              color: Color(0xFF532E29),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Images.reward),
                const SizedBox(width: 9),
                Text(
                  '200',
                  style: AppFonts.bodyXS().copyWith(
                    color: AppColors.textBeige,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Container(
            height: 26,
            width: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: const Color(0xFF293253),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: SvgPicture.asset(Images.menu),
          ),
        ],
      ),
    );
  }
}
