import 'package:fluro/fluro.dart';
import 'package:flutter_twitter_web/router/admin_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  //Home Router
  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard
  static String dashboardRoute = 'dashboard';

  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    //router.define(registerRoute, handler: handler);
  }
}
