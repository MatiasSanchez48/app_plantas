import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/extensions/strings.dart';
import 'package:flutter/material.dart';

/// add description
class InitialsNames extends StatelessWidget {
  const InitialsNames({
    required this.nameComplete,
    this.radius = 20,
    super.key,
  });

  /// add description
  final String nameComplete;

  /// add description
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.primary,
      child: Text(
        nameComplete.initalsName(),
        style: TextStyle(
          color: colors.onBackground,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
