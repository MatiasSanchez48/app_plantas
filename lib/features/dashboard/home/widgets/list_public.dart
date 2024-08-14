import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/widgets/widgets.dart';
import 'package:app_plantas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// TODO: Add description.
class ListOfPublics extends StatelessWidget {
  const ListOfPublics({
    required this.title,
    required this.plants,
    super.key,
  });

  /// TODO: Add description.
  final String title;

  /// TODO: Add description.
  final List<Plant> plants;

  /// TODO: Add description.
  void _navigateToDetails(BuildContext context) {
    // context.pushRoute(
    //   const RouteDetails(modelPublics:modelPublics),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (BuildContext context, int index) => GestureDetector(
          onTap: () => _navigateToDetails(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SelectableText(
                  title,
                  style: TextStyle(
                    color: colors.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: plants.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CardPublish(
                  plant: plants[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
