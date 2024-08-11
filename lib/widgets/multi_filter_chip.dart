import 'package:flutter/material.dart';

class MultiFilterChip extends StatelessWidget {
  const MultiFilterChip({
    required this.filters,
    required this.onSelected,
    super.key,
  });

  final List<String> filters;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: filters
          .map(
            (e) => FilterChip(
              label: Text(e),
              onSelected: (v) {
                if (v) {
                  onSelected(e);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
