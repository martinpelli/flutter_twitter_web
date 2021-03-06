import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';

import 'package:flutter_twitter_web/api/CafeApi.dart';

import 'package:flutter_twitter_web/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:flutter_twitter_web/ui/layouts/splash/splash_layout.dart';

import 'package:flutter_twitter_web/router/router.dart';

import 'package:flutter_twitter_web/services/local_storage.dart';
import 'package:flutter_twitter_web/services/navigation_services.dart';
import 'package:flutter_twitter_web/services/notifications_service.dart';

import 'package:flutter_twitter_web/ui/layouts/auth/auth_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => SideMenuProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthStatus.authenticated)
          return DashboardLayout(child: child!);
        else
          return AuthLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.3)))),
    );
  }
}
