import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template FormRegister}
/// TODO: Add description.
/// {@endtemplate}
class FormRegister extends StatefulWidget {
  /// {@macro FormRegister}
  const FormRegister({
    super.key,
  });

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  /// form key
  final _formKey = GlobalKey<FormState>();

  /// controller name
  final _controllerName = TextEditingController();

  /// controller email
  final _controllerEmail = TextEditingController();

  /// controller password
  final _controllerPassword = TextEditingController();

  /// Bool for terms and conditions.
  bool _temsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextfildPassword(
            controller: _controllerName,
            hintText: 'Enter your name', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 15),
          Text(
            'E-mail address', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextFormField(
            controller: _controllerEmail,
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
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: _temsAndConditions,
                onChanged: (e) => setState(() => _temsAndConditions = e!),
              ),
              GestureDetector(
                onTap: () =>
                    setState(() => _temsAndConditions = !_temsAndConditions),
                child: Text(
                  'By Signing Agree with ', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.onBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // TODO(anyone): open to terms and policy.
                },
                child: Text(
                  'Terms & Policy', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _ButtonsSignUpAndSignIn(formKey: _formKey),
        ],
      ),
    );
  }
}

class _ButtonsSignUpAndSignIn extends StatelessWidget {
  const _ButtonsSignUpAndSignIn({
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
                'Sign Up', // TODO(anyone): l10n
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
                'Sign In', // TODO(anyone): l10n
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
