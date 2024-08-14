import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/auth/login/bloc/bloc_login.dart';
import 'package:app_plantas/features/auth/login/widgets/dialogs/dialogs.dart';
import 'package:app_plantas/features/auth/login/widgets/widgets.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template FormularioLogin}
/// TODO: Add description.
/// {@endtemplate}
class FormularioLogin extends StatefulWidget {
  /// {@macro FormularioLogin}
  const FormularioLogin({super.key});

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

  /// TODO: Add description.
  bool? _invalidCredentials;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _dialogRecoveryPassword(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<BlocLogin>(),
        child: const DialogEmailToRequestPassword(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: DefaultTextStyle(
        style: TextStyle(
          color: colors.onBackground,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email', // TODO(anyone): l10n
                  ),
                  const SizedBox(height: 10),
                  PlantsTextFormField(
                    controller: _controllerEmail,
                    autofillHints: const [AutofillHints.email],
                    inputFormatters: [EmailInputFormatter()],
                    preffixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email', // TODO(anyone): l10n
                  )
                      .animate()
                      .slide()
                      .fade(duration: const Duration(seconds: 1)),
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
                  )
                      .animate()
                      .slide()
                      .fade(duration: const Duration(seconds: 1)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => _dialogRecoveryPassword(context),
                  child: Text(
                    'forgot password?', // TODO(anyone): l10n
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: colors.onBackground,
                    ),
                  ),
                ),
              ],
            ),
            if ((_controllerEmail.text.isEmpty ||
                    _controllerPassword.text.isEmpty) &&
                _invalidCredentials != null &&
                _invalidCredentials == false)
              Text(
                'Check credentials', // TODO(anyone): l10n
                style: TextStyle(
                  color: colors.redPlants,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (_invalidCredentials == false)
              Text(
                'Invalid email or password', // TODO(anyone): l10n
                style: TextStyle(
                  color: colors.redPlants,
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(height: 50),
            ButtonsSignInAndSignUp(
              onPressed: (value) => setState(() => _invalidCredentials = value),
              controllerEmail: _controllerEmail,
              controllerPassword: _controllerPassword,
            ),
          ],
        ),
      ),
    );
  }
}
