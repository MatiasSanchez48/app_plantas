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
        children: [
          Text(
            'Email', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.background,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextFormField(
            controller: _controllerEmail,
            preffixIcon: Icons.email_outlined,
            hintText: 'Email', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 15),
          Text(
            'Password', // TODO(anyone): l10n
            style: TextStyle(
              color: colors.background,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          PlantsTextfildPassword(
            controller: _controllerPassword,
            hintText: 'Password', // TODO(anyone): l10n
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
                      context.pushRoute(const RouteHome());
                    },
                    child: Text(
                      'Sign in', // TODO(anyone): l10n
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
