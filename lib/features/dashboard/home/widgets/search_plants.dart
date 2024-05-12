import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SearchPlants extends StatefulWidget {
  const SearchPlants({super.key});

  @override
  State<SearchPlants> createState() => _SearchPlantsState();
}

class _SearchPlantsState extends State<SearchPlants> {
  final _controllerSearchPlants = TextEditingController();

  @override
  void dispose() {
    _controllerSearchPlants.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controllerSearchPlants,
              decoration: InputDecoration(
                filled: true,
                fillColor: colors.background,
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: colors.greyNotImage,
                ),
                hintText: 'Search plants',
                hintStyle: TextStyle(
                  color: colors.greyNotImage,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: colors.greySubTitle,
                fontSize: 12,
                height: 1,
              ),
            ),
          ),
          IconButton.filledTonal(
            color: colors.primary,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.background),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.access_time,
              color: colors.greySubTitle,
            ),
          ),
          IconButton.filledTonal(
            color: colors.primary,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.background),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.filter_list_rounded,
              color: colors.greySubTitle,
            ),
          ),
          IconButton.filledTonal(
            color: colors.primary,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.background),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.drive_file_move_outlined,
              color: colors.greySubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
