import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/ui/shared/widgets/search_Text.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBocDecoration(),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
          SizedBox(width: 5),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBocDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
