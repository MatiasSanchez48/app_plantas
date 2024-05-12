import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

// TODO(anyone): add documentation
class LogoWithCloud extends StatelessWidget {
  const LogoWithCloud({
    required this.child,
    super.key,
  });

  /// TODO(anyone): add documentation
  factory LogoWithCloud.upCloud() => const LogoWithCloud(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(child: Logo()),
            CloudWidget(),
          ],
        ),
      );

  /// TODO(anyone): add documentation
  factory LogoWithCloud.downCloud() => const LogoWithCloud(
        child: Column(
          children: [
            CloudWidget(isCloudDown: true),
            SizedBox(height: 20),
            Center(child: Logo()),
            SizedBox(height: 30),
          ],
        ),
      );

  /// TODO(anyone): add documentation
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            colors.primaryOpacity80,
            colors.primary,
          ],
        ),
      ),
      child: child,
    );
  }
}
