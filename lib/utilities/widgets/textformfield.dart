import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';
// TODO(anyone): add documentation
class PlantsTextFormField extends StatelessWidget {
  const PlantsTextFormField({
    required this.controller,
    this.onEditingComplete,
    this.keyboardType,
    this.preffixIcon,
    this.fillColor,
    this.hintText,
    super.key,
  });

  final String? hintText;

  final IconData? preffixIcon;

  final Color? fillColor;

  final TextEditingController controller;

  final TextInputType? keyboardType;

  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: colors.onBackground,
        fontSize: 16,
      ),
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? colors.background,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colors.onSecondary,
          fontSize: 16,
        ),
      ),
    );
  }
}

class PlantsTextfildPassword extends StatelessWidget {
  const PlantsTextfildPassword({
    required this.controller,
    this.hintText,
    super.key,
  });

  final TextEditingController controller;

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return PlantsTextFormField(
      controller: controller,
      hintText: hintText,
    );
  }
}
