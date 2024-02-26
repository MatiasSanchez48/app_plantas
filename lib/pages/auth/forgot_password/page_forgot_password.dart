import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

@RoutePage()

/// {@template PageForgotPassword}
/// TODO: Add description.
/// {@endtemplate}
class PageForgotPassword extends StatelessWidget {
  /// {@macro PageForgotPassword}
  const PageForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CustomScaffold(
      backgroundColor: colors.primaryOpacity80,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'Forgot Password', // TODO(anyone): l10n
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colors.background,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                const FormForgotPassword(),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => context.router.replace(const RouteLogin()),
                      child: Text(
                        'Back to Login', // TODO(anyone): l10n
                        style: TextStyle(
                          color: colors.backgroundOpacity50,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          decorationColor: colors.background,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'New password', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.background,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextfildPassword(
            controller: _controllerNewPassword,
            hintText: 'New password', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 25),
          Text(
            'Repeat password', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.background,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextfildPassword(
            controller: _controllerRepeatPassword,
            hintText: 'Repeat Password', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 100),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colors.primaryOpacity50,
                        colors.primaryOpacity30,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MaterialButton(
                    elevation: 5,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO(anyone): agregar funcionalidad cuando pase la
                        // condiciones
                      }
                    },
                    child: Text(
                      "Change Password", // TODO(anyone): l10n
                      style: TextStyle(
                        color: colors.background,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
                    .animate()
                    .slide()
                    .fade(duration: const Duration(seconds: 1))
                    .shimmer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
