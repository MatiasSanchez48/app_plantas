import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/users.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// TODO(anyone): Add description
class DialogSuccessToLogin extends StatelessWidget {
  const DialogSuccessToLogin({
    required this.usuario,
    super.key,
  });

  final User usuario;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Login successfully', // TODO(anyone): l10n
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
                onPressed: () => context.router.replace(RouteDashBoard()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
