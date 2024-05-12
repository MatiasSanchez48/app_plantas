import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/login/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()

/// {@template PageLogin}
/// TODO: Add description.
/// {@endtemplate}
class PageLogin extends StatelessWidget {
  /// {@macro PageLogin}
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CustomScaffold(
      backgroundColor: colors.background,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LogoWithCloud.upCloud(),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  'Sign in', // TODO(anyone): l10n
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colors.onBackground,
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FormularioLogin(),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
