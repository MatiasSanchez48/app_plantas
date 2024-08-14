import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

// TODO(anyone): add documentation
class CloudWidget extends StatelessWidget {
  const CloudWidget({
    this.isCloudDown = false,
    super.key,
  });
// TODO(anyone): add documentation
  final bool isCloudDown;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isCloudDown ? 130 : 90,
      child: Stack(
        children: [
          Positioned(
            top: isCloudDown ? -40 : 20,
            left: -10,
            child: const CloudPart(radius: 55),
          ),
          Positioned(
            top: isCloudDown ? -20 : 10,
            left: 80,
            child: const CloudPart(radius: 65),
          ),
          Positioned(
            top: isCloudDown ? -30 : 15,
            left: 180,
            child: const CloudPart(radius: 70),
          ),
          Positioned(
            top: isCloudDown ? -30 : 15,
            right: 60,
            child: const CloudPart(radius: 70),
          ),
          Positioned(
            top: isCloudDown ? -40 : 20,
            right: -10,
            child: const CloudPart(radius: 55),
          ),
        ],
      ),
    );
  }
}

// TODO(anyone): add documentation
class CloudPart extends StatelessWidget {
  const CloudPart({
    required this.radius,
    super.key,
  });

// TODO(anyone): add documentation
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.background,
        boxShadow: [
          BoxShadow(
            color: colors.background.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(3, 0),
          ),
        ],
      ),
    );
  }
}
