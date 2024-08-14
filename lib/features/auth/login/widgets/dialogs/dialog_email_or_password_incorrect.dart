import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:flutter/material.dart';

/// TODO: Add description.
class DialogEmailOrPasswordIncorrect extends StatelessWidget {
  const DialogEmailOrPasswordIncorrect({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Email or password incorrect !', // TODO(anyone): l10n
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
                text: 'Ok', // TODO(anyone): l10n
                onPressed: () => Navigator.of(context).pop(),
                backgoundColor: colors.background,
                textColor: colors.onSecondary,
                borderColor: colors.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
