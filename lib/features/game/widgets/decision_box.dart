import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystery/app/models/event_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/utils/images.dart';

class DecisionBox extends StatefulWidget {
  const DecisionBox({
    required this.decisionEvent,
    super.key,
  });

  final DecisionEventModel decisionEvent;

  @override
  State<DecisionBox> createState() => _DecisionBoxState();
}

class _DecisionBoxState extends State<DecisionBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 45),
        Text(
          'Make A decision',
          style: AppFonts.bodySmall(
            color: white04,
          ),
        ),
        const SizedBox(height: 20),
        for (final decision in widget.decisionEvent.decisionDetails.entries) ...[
          _DecisionItem(title: decision.key),
          const SizedBox(height: 10),
        ],
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
                'Custom',
                style: AppFonts.bodySmall().copyWith(
                  color: AppColors.textBeige,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _DecisionItem extends StatelessWidget {
  const _DecisionItem({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 250,
      ),
      child: Card(
        color: AppColors.gameBlue,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          child: Center(
            child: Text(
              title,
              style: AppFonts.bodyMedium().copyWith(
                color: AppColors.textBeige,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
