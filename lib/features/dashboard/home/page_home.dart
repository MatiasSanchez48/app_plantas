import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()

/// {@template PageHome}
/// TODO: Add description.
/// {@endtemplate}
class PageHome extends StatelessWidget {
  /// {@macro PageHome}
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocHome, BlocHomeState>(
      builder: (context, state) => const Column(
        children: [
          Text('Home'),
        ],
      ),
    );
  }
}
