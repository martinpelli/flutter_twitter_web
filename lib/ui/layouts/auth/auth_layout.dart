import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/widgets/custom_tittle.dart';
import 'package:flutter_twitter_web/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Scrollbar(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),
          LinksBar()
        ],
      ),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(height: 29),
        CustomTittle(),
        Container(
          width: double.infinity,
          height: 420,
          child: child,
        ),
        Container(
          width: double.infinity,
          height: 400,
          child: BackgroundTwitterMobile(),
        )
      ]),
    );
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
          BackgroundTwitterDesktop(),
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
