import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template CustomScaffold}
/// TODO: Add description.
/// {@endtemplate}
class CustomScaffold extends StatelessWidget {
  /// {@macro CustomScaffold}
  const CustomScaffold({
    required this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.withAppbar = false,
    this.titleAppBar = '',
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    super.key,
  });

  /// {@macro CustomScaffold}
  ///
  /// `body`:
  /// - To display.
  final Widget body;

  /// {@macro CustomScaffold}
  ///
  /// `backgroundColor`:
  /// - Background color.
  final Color? backgroundColor;

  /// {@macro CustomScaffold}
  ///
  /// `title`:
  /// - Title of the app bar.
  final String titleAppBar;

  /// {@macro CustomScaffold}
  ///
  /// `bottomNavigationBar`:
  /// - Bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// {@macro CustomScaffold}
  ///
  /// `withAppbar`:
  /// - If the app bar should be displayed.
  final bool withAppbar;

  /// {@macro CustomScaffold}
  ///
  /// `floatingActionButtonLocation`:
  /// - If null, the [ScaffoldState] will use the default location,
  /// [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// {@macro CustomScaffold}
  ///
  /// `floatingActionButton`:
  /// - Floating action button.
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      endDrawer: withAppbar ? const CustomDrawer() : null,
      bottomNavigationBar: bottomNavigationBar,
      body: withAppbar
          ? Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      _CustomAppBar(title: titleAppBar),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 65,
                  child: body,
                ),
              ],
            )
          : body,
    );
  }
}

/// {@template _CustomAppBar}
/// TODO: Add description.
/// {@endtemplate}
class _CustomAppBar extends StatelessWidget {
  /// {@macro _CustomAppBar}
  const _CustomAppBar({
    required this.title,
  });

  /// TODO: Add description.
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        gradient: LinearGradient(
          colors: [
            colors.primaryOpacity50,
            colors.primaryOpacity80,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors.background,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: colors.background,
                size: 25,
              ),
              onPressed: () {
                // Acciones al hacer clic en el icono de configuración
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
