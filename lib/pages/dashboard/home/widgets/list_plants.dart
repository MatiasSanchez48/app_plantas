import 'package:app_plantas/pages/dashboard/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListPlants extends StatelessWidget {
  const ListPlants({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => const CardPlants(),
      ),
    );
  }
}
