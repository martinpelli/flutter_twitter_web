import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/widgets/custom_tittle.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: ClampingScrollPhysics(),
      children: [_DesktopBody(child: child), LinksBar()],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [
          BackgroundTwitter(),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(children: [
              SizedBox(height: 20),
              CustomTittle(),
              SizedBox(height: 20),
              Expanded(child: child)
            ]),
          )
        ],
      ),
    );
  }
}
