import 'package:fluro/fluro.dart';
import 'package:flutter_twitter_web/providers/auth_provider.dart';
import 'package:flutter_twitter_web/ui/views/dashboard_view.dart';
import 'package:flutter_twitter_web/ui/views/login_view.dart';
import 'package:flutter_twitter_web/ui/views/register_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return RegisterView();
    else
      return DashboardView();
  });
}
