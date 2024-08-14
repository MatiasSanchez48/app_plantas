import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// TODO: Add description
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  User? _user;

  final SharedPreferencesHelper _sharedPreferences = SharedPreferencesHelper();

  @override
  void initState() {
    super.initState();
    _sharedPreferences.getUser().then((value) => setState(() => _user = value));
  }

  void _dialogLogout(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              Text(
                '¿Deseas cerrar sesión?', // TODO(anyone): l10n
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                Expanded(child: PlantsBotton.cancel(context)),
                const SizedBox(width: 10),
                Expanded(
                  child: PlantsBotton(
                    text: 'Aceptar',
                    onPressed: () async {
                      await SharedPreferencesHelper.clearUser();
                      await context.router.replaceAll([const RouteLogin()]);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Drawer(
      backgroundColor: colors.background,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 20,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: colors.background,
                    child: Image.network(
                      _user?.urlImage ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/beer.png'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        SelectableText(
                          _user?.username ?? '',
                          maxLines: 1,
                        ),
                        SelectableText(
                          _user?.email ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                child: Column(
                  children: [
                    //* Home
                    ListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.home_rounded),
                          SizedBox(width: 10),
                          Text('Home'), // TODO add l10n
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.pushRoute(RouteHome());
                      },
                    ),
                    //* categories
                    ListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.grid_view_rounded),
                          SizedBox(width: 10),
                          Text('Categories'), // TODO add l10n
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.pushRoute(const RouteCategory());
                      },
                    ),
                    //* users
                    ListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.person_rounded),
                          SizedBox(width: 10),
                          Text('Users'), // TODO add l10n
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.pushRoute(const RouteChats());
                      },
                    ),
                    //* settings
                    ListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.settings_rounded),
                          SizedBox(width: 10),
                          Text('Settings'), // TODO add l10n
                        ],
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ListTile(
              title: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.login_rounded),
                  SizedBox(width: 10),
                  Text('Logout'), // TODO add l10n
                ],
              ),
              onTap: () => _dialogLogout(context),
            ),
            const ChangeTheme(),
          ],
        ),
      ),
    );
  }
}
