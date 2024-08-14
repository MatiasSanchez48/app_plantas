import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/register/bloc/bloc_register.dart';
import 'package:app_plantas/models/users.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template FormularioLogin}
/// TODO: Add description.
/// {@endtemplate}
class ButtonsSignUpAndSignIn extends StatelessWidget {
  const ButtonsSignUpAndSignIn({
    required GlobalKey<FormState> formKey,
    required this.termsAndConditions,
    required this.controllerPassword,
    required this.controllerEmail,
    required this.controllerName,
    required this.onPressed,
    super.key,
  }) : _formKey = formKey;

  final TextEditingController controllerPassword;

  final TextEditingController controllerEmail;

  final TextEditingController controllerName;

  final void Function(bool value) onPressed;

  final GlobalKey<FormState> _formKey;

  final bool termsAndConditions;

  void _onRegister(BuildContext context) {
    if (termsAndConditions) {
      if (_formKey.currentState!.validate()) {
        onPressed(true);
        context.read<BlocRegister>().add(
              BlocRegisterEventRegister(
                usuarioDto: UsersDto(
                  username: controllerName.text,
                  email: controllerEmail.text,
                  password: controllerPassword.text,
                ),
              ),
            );
      } else {
        onPressed(false);
      }
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
          child: PlantsBotton(
            text: 'Sign Up', // TODO(anyone): l10n
            onPressed: () => _onRegister(context),
            backgoundColor: colors.primary,
            textColor: colors.background,
          )
              .animate()
              .slide()
              .fade(duration: const Duration(seconds: 1))
              .shimmer(),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PlantsBotton(
            text: 'Sign In', // TODO(anyone): l10n
            onPressed: () => context.replaceRoute(const RouteLogin()),
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
