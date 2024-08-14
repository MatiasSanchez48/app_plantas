import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO: add description
class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  void _onCreateNewPlants(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<BlocHome>(),
        child: const BottomSheetAddPlant(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FloatingActionButton(
      onPressed: () => _onCreateNewPlants(context),
      tooltip: 'Add new plant', // TODO: Add translations.
      backgroundColor: colors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: Icon(
        Icons.add,
        color: colors.onBackground,
        size: 25,
      ),
    );
  }
}
