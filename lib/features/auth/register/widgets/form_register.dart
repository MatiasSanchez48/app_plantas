import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/register/bloc/bloc_register.dart';
import 'package:app_plantas/features/auth/register/widgets/widgets.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool? _termsAndConditions;

  ///
  bool? _invalidCredentials;

  @override
  void dispose() {
    _controllerPassword.dispose();
    _controllerEmail.dispose();
    _controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: DefaultTextStyle(
          style: TextStyle(
            color: colors.onBackground,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name', // TODO(anyone): l10n
              ),
              const SizedBox(height: 10),
              PlantsTextFormField(
                controller: _controllerName,
                preffixIcon: Icons.person_outlined,
                autofillHints: const [AutofillHints.name],
                keyboardType: TextInputType.name,
                hintText: 'Enter your name', // TODO(anyone): l10n
              ).animate().slide().fade(duration: const Duration(seconds: 1)),
              const SizedBox(height: 15),
              const Text(
                'E-mail address', // TODO(anyone): l10n
              ),
              const SizedBox(height: 10),
              PlantsTextFormField(
                controller: _controllerEmail, preffixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                hintText: 'Enter your email', // TODO(anyone): l10n
              ).animate().slide().fade(duration: const Duration(seconds: 1)),
              const SizedBox(height: 15),
              const Text(
                'Password', // TODO(anyone): l10n
              ),
              const SizedBox(height: 10),
              PlantsTextfildPassword(
                controller: _controllerPassword,
                autofillHints: const [AutofillHints.password],
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Enter your password', // TODO(anyone): l10n
              ).animate().slide().fade(duration: const Duration(seconds: 1)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _termsAndConditions ?? false,
                    onChanged: (e) => setState(() => _termsAndConditions = e!),
                  ),
                  GestureDetector(
                    onTap: () => setState(() =>
                        _termsAndConditions = !(_termsAndConditions ?? false)),
                    child: const Text(
                      'By Signing Agree with ', // TODO(anyone): l10n
                      style: TextStyle(
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
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_termsAndConditions == false && _invalidCredentials == false)
                Text(
                  'Accept Terms & Policy', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.redPlants,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if ((_controllerEmail.text.isEmpty ||
                      _controllerPassword.text.isEmpty ||
                      _controllerName.text.isEmpty) &&
                  _invalidCredentials != null &&
                  _invalidCredentials == false)
                Text(
                  'Check credentials', // TODO(anyone): l10n
                  style: TextStyle(
                    color: colors.redPlants,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              BlocBuilder<BlocRegister, BlocRegisterState>(
                builder: (context, state) {
                  if (state is BlocRegisterStateErrorUserAlreadyExists) {
                    return Text(
                      'User already exists', // TODO(anyone): l10n
                      style: TextStyle(
                        color: colors.redPlants,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                  return const Text(
                    '', // TODO(anyone): l10n
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ButtonsSignUpAndSignIn(
                controllerPassword: _controllerPassword,
                termsAndConditions: _termsAndConditions ?? false,
                controllerEmail: _controllerEmail,
                controllerName: _controllerName,
                formKey: _formKey,
                onPressed: (value) => setState(
                  () => _invalidCredentials = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
