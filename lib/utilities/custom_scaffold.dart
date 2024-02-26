import 'package:app_plantas/app/view/bloc/bloc_theme.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      endDrawer: withAppbar
          ? Drawer(
              // Aquí puedes personalizar tu EndDrawer
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('End Drawer'),
                  ),
                  ListTile(
                    title: Text('Opción 1'),
                    onTap: () {
                      // Cerrar el EndDrawer y realizar alguna acción
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Opción 2'),
                    onTap: () {
                      // Cerrar el EndDrawer y realizar alguna acción
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Cambia Theme'),
                    onTap: () {
                      final state = context.read<BlocTheme>().state;
                      if (state.themeDark) {
                          context.read<BlocTheme>().add(
                              const BlocThemeEventToggleTheme(
                                
                              ),
                            );
                      } else {
                        context.read<BlocTheme>().add(
                              const BlocThemeEventToggleTheme(
                                themeDark: true,
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            )
          : null,
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
