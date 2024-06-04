import 'package:flutter/material.dart';

// TODO(anyone): add documentation
class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.radius = 50,
  });

  ///
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.asset('assets/images/planta.png'),
      ),
    );
  }
}
