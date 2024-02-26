import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

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
        color: colors.background,
        fontSize: 16,
      ),
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? colors.primaryOpacity30,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintStyle: TextStyle(
          color: colors.background,
          fontSize: 16,
        ),
        prefixIcon: Icon(
          preffixIcon,
          color: colors.background,
          size: 20,
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
      preffixIcon: Icons.lock_outline_rounded,
      hintText: hintText,
    );
  }
}
