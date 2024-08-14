import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DialogErrorToChangePassword extends StatelessWidget {
  const DialogErrorToChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Error to change password', // TODO(anyone): l10n
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
                text: 'Cancel', // TODO(anyone): l10n
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
