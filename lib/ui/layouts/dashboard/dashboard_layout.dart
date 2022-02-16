import 'package:flutter/material.dart';

import 'package:flutter_twitter_web/ui/shared/sidebar.dart';
import '../../shared/navbar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDF1F2),
        body: Row(
          children: [
            Sidebar(),
            Expanded(
                child: Column(children: [Navbar(), Expanded(child: child)]))
          ],
        ));
  }
}
