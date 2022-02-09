import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/router/router.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/auth_layout.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        return AuthLayout();
      },
    );
  }
}
