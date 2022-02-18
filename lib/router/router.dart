import 'package:fluro/fluro.dart';
import 'package:flutter_twitter_web/router/admin_handlers.dart';
import 'package:flutter_twitter_web/router/dashboard_handler.dart';
import 'package:flutter_twitter_web/router/not_found_view_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  //Home Router
  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard
  static String dashboardRoute = 'dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  //Not Found
  static String notFoundRoute = 'notfound';

  static void configureRoutes() {
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = NotFoundViewHandlers.notFoundView;
  }
}
