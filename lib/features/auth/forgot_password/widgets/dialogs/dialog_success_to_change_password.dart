import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// TODO Add description.
class DialogSuccessToChangePassword extends StatelessWidget {
  const DialogSuccessToChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Password successfully changed', // TODO(anyone): l10n
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colors.onBackground,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: PlantsBotton(
                text: 'Continue', // TODO(anyone): l10n
                onPressed: () => context.router.replace(const RouteLogin()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
