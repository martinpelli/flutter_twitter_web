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
  static String categoriesRoute = '/dashboard/categories';
  static String blankRoute = '/dashboard/blank';
  static String usersRoute = '/dashboard/users';
  static String userRoute = '/dashboard/user/:uid';

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
    router.define(categoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);
    router.define(usersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = NotFoundViewHandlers.notFoundView;
  }
}
