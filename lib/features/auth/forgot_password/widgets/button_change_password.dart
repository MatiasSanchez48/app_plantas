import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/forgot_password/bloc/bloc_forgot_password.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// TODO Add description
class ButtonsChangePasswordAndBack extends StatelessWidget {
  const ButtonsChangePasswordAndBack({
    required GlobalKey<FormState> formKey,
    required this.controllerRepeatPassword,
    required this.controllerNewPassword,
    required this.onPressed,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  final TextEditingController controllerNewPassword;

  final TextEditingController controllerRepeatPassword;

  final void Function(bool value) onPressed;

  void _onChangePassword(BuildContext context) {
    if ((controllerNewPassword.text.isNotEmpty ||
            controllerRepeatPassword.text.isNotEmpty) &&
        (controllerNewPassword.text == controllerRepeatPassword.text)) {
      onPressed(false);
      if (_formKey.currentState!.validate()) {
        context.read<BlocForgotPassword>().add(
              BlocForgotPasswordEventChangePassword(
                usuarioDto: UsersDto(
                  newPassword: controllerNewPassword.text,
                ),
              ),
            );
      }
    } else {
      onPressed(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Expanded(
          child: PlantsBotton(
            text: 'Change password', // TODO(anyone): l10n
            onPressed: () => _onChangePassword(context),
            backgoundColor: colors.primary,
          )
              .animate()
              .slide()
              .fade(duration: const Duration(seconds: 1))
              .shimmer(),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PlantsBotton(
            text: 'Back', // TODO(anyone): l10n
            textColor: colors.onSecondary,
            backgoundColor: colors.background,
            onPressed: () => context.replaceRoute(const RouteLogin()),
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
