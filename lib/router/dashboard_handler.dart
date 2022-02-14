import 'package:fluro/fluro.dart';
import 'package:flutter_twitter_web/ui/views/login_view.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'package:flutter_twitter_web/ui/views/dashboard_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });
}
