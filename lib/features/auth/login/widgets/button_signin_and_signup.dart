import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/login/bloc/bloc_login.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template FormularioLogin}
/// TODO: Add description.
/// {@endtemplate}
class ButtonsSignInAndSignUp extends StatelessWidget {
  const ButtonsSignInAndSignUp({
    required this.onPressed,
    required this.controllerEmail,
    required this.controllerPassword,
    super.key,
  });

  final TextEditingController controllerEmail;

  final TextEditingController controllerPassword;

  final void Function(bool success) onPressed;

// TODO: Add description for _Buttonogin

  void _buttonLogin(BuildContext context) {
    if (controllerEmail.text.isNotEmpty || controllerPassword.text.isNotEmpty) {
      onPressed(true);
      context.read<BlocLogin>().add(
            BlocLoginEventLogin(
              usuarioDto: UsersDto(
                email: controllerEmail.text,
                password: controllerPassword.text,
              ),
            ),
          );

      // TODO(anyone): to add verifi credentials of validations
    } else {
      onPressed(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Expanded(
          child: BlocBuilder<BlocLogin, BlocLoginState>(
            builder: (context, state) {
              return PlantsBotton(
                text: 'Sign In', // TODO(anyone): l10n
                onPressed: () => _buttonLogin(context),
                backgoundColor: colors.primary,
                textColor: colors.background,
              );
            },
          )
              .animate()
              .slide()
              .fade(duration: const Duration(seconds: 1))
              .shimmer(),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PlantsBotton(
            text: 'Sign Up', // TODO(anyone): l10n
            onPressed: () => context.replaceRoute(const RouteRegister()),
            backgoundColor: colors.background,
            textColor: colors.onSecondary,
            borderColor: colors.onSecondary,
          )
              .animate()
              .slide()
              .fade(duration: const Duration(seconds: 1))
              .shimmer(),
        ),
      ],
    );
  }
}
