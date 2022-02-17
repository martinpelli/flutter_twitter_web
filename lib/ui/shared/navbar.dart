import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/providers/sidemenu_provider.dart';

import 'package:flutter_twitter_web/ui/shared/widgets/navbar_avatar.dart';
import 'package:flutter_twitter_web/ui/shared/widgets/notifications_indicator.dart';
import 'package:flutter_twitter_web/ui/shared/widgets/search_Text.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBocDecoration(),
      child: Row(
        children: [
          if (size.width <= 700) ...[
            SizedBox(width: 5),
            IconButton(
                onPressed: () {
                  SideMenuProvider.openMenu();
                },
                icon: Icon(Icons.menu_outlined)),
          ],
          SizedBox(width: 10),
          if (size.width > 390)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),
          Spacer(),
          NotificationsIndicator(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  BoxDecoration buildBocDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
