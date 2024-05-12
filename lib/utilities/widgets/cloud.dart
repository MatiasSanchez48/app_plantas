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
    this.color = Colors.white,
    super.key,
  });

// TODO(anyone): add documentation
  final double radius;

// TODO(anyone): add documentation
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(3, 0),
          ),
        ],
      ),
    );
  }
}
