import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO(anyone): add documentation
class PlantsTextFormField extends StatelessWidget {
  const PlantsTextFormField({
    required this.controller,
    this.onEditingComplete,
    this.inputFormatters,
    this.autofillHints,
    this.enabledBorder,
    this.keyboardType,
    this.preffixIcon,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.fillColor,
    this.onChanged,
    this.focusNode,
    this.hintText,
    this.maxLines = 1,
    super.key,
  });

  final TextEditingController controller;

  final String? hintText;

  final Color? fillColor;

  final bool? obscureText;

  final Widget? suffixIcon;

  final IconData? preffixIcon;

  final TextInputType? keyboardType;

  final Iterable<String>? autofillHints;

  final void Function()? onEditingComplete;

  final String? Function(String?)? validator;

  final List<TextInputFormatter>? inputFormatters;

  final InputBorder? enabledBorder;

  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      style: TextStyle(
        color: colors.onBackground,
        fontSize: 16,
      ),
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      autofillHints: autofillHints,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        prefixIcon: preffixIcon != null
            ? Icon(
                preffixIcon,
                color: colors.secondary,
              )
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? colors.background,
        enabledBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: colors.primary),
            ),
        disabledBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: colors.primary),
            ),
        errorBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: colors.primary),
            ),
        border: enabledBorder,
        hintText: hintText,
        hintStyle: TextStyle(
          color: colors.onSecondary,
          fontSize: 16,
        ),
      ),
    );
  }
}

/// TODO: Add description.
class PlantsTextfildPassword extends StatefulWidget {
  const PlantsTextfildPassword({
    required this.controller,
    this.autofillHints,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
    this.hintText,
    super.key,
  });

  final TextEditingController controller;

  final String? hintText;

  final Widget? suffixIcon;

  final TextInputType? keyboardType;

  final Iterable<String>? autofillHints;

  final String? Function(String?)? validator;

  @override
  State<PlantsTextfildPassword> createState() => _PlantsTextfildPasswordState();
}

class _PlantsTextfildPasswordState extends State<PlantsTextfildPassword> {
  /// TODO: Add description.
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return PlantsTextFormField(
      autofillHints: widget.autofillHints,
      keyboardType: widget.keyboardType,
      preffixIcon: Icons.lock_outlined,
      controller: widget.controller,
      validator: widget.validator,
      hintText: widget.hintText,
      suffixIcon: IconButton(
        onPressed: () => setState(() => isVisible = !isVisible),
        icon: Icon(
          isVisible ? Icons.visibility_off : Icons.visibility,
          color: colors.secondary,
        ),
      ),
      obscureText: isVisible,
    );
  }
}
