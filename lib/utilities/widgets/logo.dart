import 'package:flutter/material.dart';
// TODO(anyone): add documentation
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      child: ClipOval(
        child: Image.asset('assets/images/beer.png'),
      ),
    );
  }
}
