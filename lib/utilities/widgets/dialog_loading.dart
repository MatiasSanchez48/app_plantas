import 'package:flutter/material.dart';

/// TODO: Add description.
class DialogPlantsLoading extends StatelessWidget {
  const DialogPlantsLoading({super.key, this.child});
  final Widget? child;
  void show(BuildContext context, {Widget? child}) => showDialog<void>(
        context: context,
        builder: (context) => DialogPlantsLoading(
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child ?? const SizedBox.shrink(),
          const SizedBox(
            height: 100,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
