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
      backgroundColor: colors.background,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Forgot Password', // TODO(anyone): l10n
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.onBackground,
                      ),
                    ),
                  ),
                  const FormForgotPassword(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: LogoWithCloud.downCloud(),
            ),
          ],
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'New password', // TODO(anyone): l10n
              style: TextStyle(
                color: colors.onBackground,
                fontWeight: FontWeight.bold,
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
                color: colors.onBackground,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            PlantsTextfildPassword(
              controller: _controllerRepeatPassword,
              hintText: 'Repeat Password', // TODO(anyone): l10n
            ).animate().slide().fade(duration: const Duration(seconds: 1)),
            const SizedBox(height: 50),
            _ButtonsChangePasswordAndBack(formKey: _formKey),
          ],
        ),
      ),
    );
  }
}

class _ButtonsChangePasswordAndBack extends StatelessWidget {
  const _ButtonsChangePasswordAndBack({
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colors.primaryOpacity50,
                  colors.primary,
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO(anyone): to add verifi credentials of validations
                }
              },
              child: Text(
                'Change password', // TODO(anyone): l10n
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
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: colors.onSecondary),
            ),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
              onPressed: () => context.replaceRoute(const RouteLogin()),
              child: Text(
                'Back', // TODO(anyone): l10n
                style: TextStyle(
                  color: colors.onSecondary,
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
    );
  }
}
