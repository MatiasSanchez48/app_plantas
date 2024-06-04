import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/page_home.dart';
import 'package:app_plantas/features/dashboard/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// TODO: Add description.
class ListOfPublics extends StatelessWidget {
  const ListOfPublics({
    required this.title,
    required this.modelPublics,
    super.key,
  });

  /// TODO: Add description.
  final String title;

  /// TODO: Add description.
  final List<ModelPublics> modelPublics;

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
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: modelPublics.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardPublish(
                    modelPublics: modelPublics[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
