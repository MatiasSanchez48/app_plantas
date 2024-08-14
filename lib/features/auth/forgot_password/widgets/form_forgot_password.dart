import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/forgot_password/widgets/widgets.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template FormForgotPassword}
/// TODO: Add description.
/// {@endtemplate}
class FormForgotPassword extends StatefulWidget {
  /// {@macro FormForgotPassword}
  const FormForgotPassword({super.key});

  @override
  State<FormForgotPassword> createState() => _FormForgotPasswordState();
}

class _FormForgotPasswordState extends State<FormForgotPassword> {
  /// form key
  final _formKey = GlobalKey<FormState>();

  /// controller new Password
  final _controllerNewPassword = TextEditingController();

  /// controller repeat password
  final _controllerRepeatPassword = TextEditingController();

  bool? _invalidCredentials;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DefaultTextStyle(
          style: TextStyle(
            color: colors.onBackground,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'New password', // TODO(anyone): l10n
              ),
              const SizedBox(height: 10),
              PlantsTextfildPassword(
                controller: _controllerNewPassword,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'New password', // TODO(anyone): l10n
              ).animate().slide().fade(duration: const Duration(seconds: 1)),
              const SizedBox(height: 25),
              const Text(
                'Repeat password', // TODO(anyone): l10n
              ),
              const SizedBox(height: 10),
              PlantsTextfildPassword(
                controller: _controllerRepeatPassword,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Repeat Password', // TODO(anyone): l10n
              ).animate().slide().fade(duration: const Duration(seconds: 1)),
              const SizedBox(height: 50),
              if ((_controllerNewPassword.text.isEmpty ||
                      _controllerRepeatPassword.text.isEmpty) &&
                  _invalidCredentials != null &&
                  _invalidCredentials == false)
                Text(
                  'Check credentials', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.redPlants,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ButtonsChangePasswordAndBack(
                onPressed: (value) =>
                    setState(() => _invalidCredentials = value),
                formKey: _formKey,
                controllerNewPassword: _controllerNewPassword,
                controllerRepeatPassword: _controllerRepeatPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
