import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystery/app/models/event_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/features/game/bloc/event_bloc.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/utils/images.dart';

class DecisionBox extends StatefulWidget {
  const DecisionBox({
    required this.decisionEvent,
    super.key,
  });

  final EventDecisionModel decisionEvent;

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
        for (final decision in widget.decisionEvent.decisionDetails) ...[
          _DecisionItem(
            title: decision,
            decision: widget.decisionEvent.decidedEvent,
          ),
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
    this.decision,
  });

  final String title;
  final String? decision;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: decision != null
          ? null
          : () => context.read<EventBloc>().makeDecision(title),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 250),
        child: Card(
          color: AppColors.gameBlue.withOpacity(
            decision == title || decision == null ? 1 : 0.5,
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppFonts.bodyMedium().copyWith(
                  color: AppColors.textBeige,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
