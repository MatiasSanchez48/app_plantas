import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:app_plantas/app/auto_route/router_guards.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  bool isInitialized = false;
  late SharedPreferences sharedPreferences;
  Future<void> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isInitialized = true;
  }

  @override
  RouteType get defaultRouteType => const RouteType.material();

  /// Se encarga de proteger las rutas que requieren
  /// que el usuario este deslogueado, en caso de que
  /// el usuario este logueado y quiera dirigirse a este tipo
  /// de paginas, sera redireccionado a [RouteHome]
  InitialGuard get initialGuard => InitialGuard(
        sharedPreferences: sharedPreferences,
      );

  /// Se encarga de proteger las rutas que requieren
  /// que el usuario este loggeado, en caso de que
  /// el usuario este deslogueado y quiera dirigirse a este tipo
  /// de paginas, sera redireccionado a [RouteHome]
  AuthGuard get authGuard => AuthGuard(
        sharedPreferences: sharedPreferences,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RouteLogin.page,
          guards: [initialGuard],
          path: '/Login',
          initial: true,
        ),
        AutoRoute(
          page: RouteRegister.page,
          path: '/Register',
        ),
        AutoRoute(
          page: RouteForgotPassword.page,
          path: '/Forgot-Password',
          guards: [initialGuard],
        ),
        AutoRoute(
          page: RouteDashBoard.page,
          guards: [authGuard],
          path: '/DashBoard',
          children: [
            AutoRoute(
              page: RouteHome.page,
              initial: true,
              path: 'Home',
            ),
            AutoRoute(
              page: RouteChats.page,
              path: 'Chats',
              children: [
                AutoRoute(
                  page: RouteUsers.page,
                  path: 'Usuarios',
                  initial: true,
                ),
                AutoRoute(
                  page: RouteChat.page,
                  path: 'Chat/:id',
                ),
              ],
            ),
            AutoRoute(
              page: RouteConfiguration.page,
              path: 'Configuration',
            ),
            AutoRoute(
              page: RouteCategory.page,
              path: 'Category',
            ),
          ],
        ),
      ];
}
