import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template FormularioLogin}
/// TODO: Add description.
/// {@endtemplate}
class FormularioLogin extends StatefulWidget {
  /// {@macro FormularioLogin}
  const FormularioLogin({
    super.key,
  });

  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  /// form key
  final _formKey = GlobalKey<FormState>();

  /// controller email
  final _controllerEmail = TextEditingController();

  /// controller password
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextFormField(
            controller: _controllerEmail,
            preffixIcon: Icons.email_outlined,
            hintText: 'Enter your email', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 15),
          Text(
            'Password', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextfildPassword(
            controller: _controllerPassword,
            hintText: 'Enter your password', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => context.replaceRoute(const RouteForgotPassword()),
                child: Text(
                  'forgot password?', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.onBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: colors.onBackground,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          _ButtonsSignInAndSignUp(formKey: _formKey),
        ],
      ),
    );
  }
}

class _ButtonsSignInAndSignUp extends StatelessWidget {
  const _ButtonsSignInAndSignUp({
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
                context.pushRoute(const RouteHome());
                if (_formKey.currentState!.validate()) {
                  // TODO(anyone): to add verifi credentials of validations
                }
              },
              child: Text(
                'Sign In', // TODO(anyone): l10n
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
              onPressed: () => context.replaceRoute(const RouteRegister()),
              child: Text(
                'Sign Up', // TODO(anyone): l10n
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
