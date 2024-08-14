import 'package:app_plantas/features/dashboard/settings/widgets/widgets.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

/// {@template PageConfiguration}
/// TODO: Add description.
/// {@endtemplate}
@RoutePage()
class PageConfiguration extends StatelessWidget {
  /// {@macro PageConfiguration}
  const PageConfiguration({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerFloacting(),
        SizedBox(height: 20),
      ],
    );
  }
}
