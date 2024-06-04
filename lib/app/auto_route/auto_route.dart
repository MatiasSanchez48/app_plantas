import 'package:app_plantas/app/auto_route/auto_route.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RouteLogin.page,
          initial: true,
          path: '/Login',
        ),
        AutoRoute(
          page: RouteRegister.page,
          path: '/Register',
        ),
        AutoRoute(
          page: RouteForgotPassword.page,
          path: '/Forgot-Password',
        ),
        AutoRoute(
          page: RouteDashBoard.page,
          path: '/DashBoard',
          children: [
            AutoRoute(
              page: RouteHome.page,
              initial: true,
              path: 'Home',
            ),
            AutoRoute(
              page: RouteConfiguration.page,
              path: 'Configuration',
            ),
            AutoRoute(
              page: RouteCategory.page,
              path: 'Category',
            ),
            AutoRoute(
              page: RouteProfile.page,
              path: 'Profile',
            ),
          ],
        ),
      ];
}
