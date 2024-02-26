import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/pages/dashboard/settings/widgets/widgets.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()

/// {@template PageConfiguration}
/// TODO: Add description.
/// {@endtemplate}
class PageConfiguration extends StatelessWidget {
  /// {@macro PageConfiguration}
  const PageConfiguration({super.key});
  @override
  Widget build(BuildContext context) {
    final listUp = [
      const _ModelCategory(
        name: 'Recording',
        icon: Icons.lock_clock,
        id: 1,
      ),
      const _ModelCategory(
        name: 'Light meter',
        icon: Icons.sunny,
        id: 2,
      ),
    ];

    final listDown = [
      const _ModelCategory(
        name: 'Weed identifier',
        icon: Icons.grass_outlined,
        id: 1,
      ),
      const _ModelCategory(
        name: 'Toxic to pets',
        icon: Icons.dangerous_outlined,
        id: 2,
      ),
    ];

    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ContainerFloacting(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Services',
            style: TextStyle(
              color: colors.onSecondary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 180,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: listUp.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 20,
                ),
                child: _CardConfiguration(
                  id: listUp[index].id,
                  text: listUp[index].name,
                  icon: listUp[index].icon,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'explore by id',
            style: TextStyle(
              color: colors.onSecondary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: listDown.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: _CardConfiguration(
                text: listDown[index].name,
                icon: listDown[index].icon,
                id: listDown[index].id,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardConfiguration extends StatelessWidget {
  const _CardConfiguration({
    required this.text,
    required this.icon,
    required this.id,
  });

  final int id;

  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colors.primaryOpacity80,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: colors.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModelCategory {
  const _ModelCategory({
    required this.name,
    required this.icon,
    required this.id,
  });

  final int id;
  final String name;
  final IconData icon;
}
