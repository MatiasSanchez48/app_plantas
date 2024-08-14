import 'package:app_plantas/app/view/bloc/bloc_app.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Divider(
            thickness: 2.5,
            color: colors.greyNotImage,
          ),
          ListTile(
            title: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.help_outline,
                ),
                SizedBox(width: 10),
                Text(
                  'Colour Scheme', // TODO add l10n
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            onTap: () {
              // TODO: change main color
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 10),
          BlocBuilder<BlocApp, BlocAppState>(
            builder: (context, state) {
              return Container(
                height: 45,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CustomSwitch(
                      iconData: Icons.sunny,
                      isThemeDark: state.themeDark,
                      text: 'Light', // TODO add l10n
                    ),
                    _CustomSwitch(
                      iconData: Icons.dark_mode_outlined,
                      isThemeDark: !state.themeDark,
                      text: 'Dark', // TODO add l10n
                      changeTheme: true,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CustomSwitch extends StatelessWidget {
  const _CustomSwitch({
    required this.isThemeDark,
    required this.text,
    required this.iconData,
    this.changeTheme = false,
  });

  final bool isThemeDark;
  final String text;
  final IconData iconData;
  final bool changeTheme;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: () => context.read<BlocApp>().add(
            BlocAppEventToggleTheme(themeDark: changeTheme),
          ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isThemeDark ? Colors.transparent : colors.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: isThemeDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: SizedBox(
          width: 125,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: colors.onBackground,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: colors.onBackground,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
