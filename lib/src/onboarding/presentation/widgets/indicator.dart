// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isActive ? 20 : 8,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? theme.colorScheme.surface
              : theme.colorScheme.surface.withOpacity(0.5),
        ),
      ),
    );
  }
}
