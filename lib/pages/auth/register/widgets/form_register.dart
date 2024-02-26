import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          PlantsTextfildPassword(
            controller: _controllerName,
            hintText: 'Nombre', // TODO(anyone): l10n
          ).animate().slide().fade(duration: const Duration(seconds: 1)),
          const SizedBox(height: 15),
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
          const SizedBox(height: 50),
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
                        // verificacion
                      }
                    },
                    child: Text(
                      'Register', // TODO(anyone): l10n
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
