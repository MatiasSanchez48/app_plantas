import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// TODO: Add description.
class PlantsBotton extends StatelessWidget {
  const PlantsBotton({
    this.text,
    this.isLoading = false,
    this.height = 45,
    this.backgoundColor,
    this.borderColor,
    this.onPressed,
    this.textColor,
    this.width,
    super.key,
    this.child,
  });

  ///
  factory PlantsBotton.cancel(BuildContext context) {
    final colors = context.colors;

    return PlantsBotton(
      text: 'Cancelar', //TODO(anyone): l10n
      borderColor: colors.primary,
      backgoundColor: colors.background,
      textColor: colors.primary,
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  final Widget? child;
  final Color? backgoundColor;
  final Color? textColor;
  final Color? borderColor;
  final double height;
  final double? width;
  final String? text;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            (backgoundColor ?? colors.primary).withOpacity(0.5),
            backgoundColor ?? colors.primary,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : child ??
                Text(
                  text ?? 'Button',
                  style: TextStyle(
                    color: textColor ?? colors.background,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
      ),
    );
  }
}
